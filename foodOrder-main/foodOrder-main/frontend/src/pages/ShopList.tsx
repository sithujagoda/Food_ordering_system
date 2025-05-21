import { useQuery } from "@tanstack/react-query";
import { fetchAllShops } from "../lib/data-services";
import { useState } from "react";
import { Search } from "lucide-react";
import Shop from "../components/Shop";

// Define the Shop interface
interface Shop {
    shopID: string;
    shopName: string;
    location: string;
    telephone_No: string;
}

function ShopList() {
    const [filterLocation, setFilterLocation] = useState<string>("All");
    const [searchTerm, setSearchTerm] = useState<string>("");
    const { data, isPending, isError, error } = useQuery<Shop[], Error>({
        queryKey: ["shops"],
        queryFn: fetchAllShops,
    });

    if (isPending) {
        return (
            <div className="flex items-center justify-center min-h-[400px] bg-gray-50 rounded-lg">
                <div className="flex flex-col items-center">
                    <div className="w-16 h-16 border-4 border-blue-500 border-t-transparent rounded-full animate-spin mb-4"></div>
                    <div className="text-lg font-medium text-gray-700">Loading shops...</div>
                </div>
            </div>
        );
    }

    if (isError) {
        return (
            <div className="bg-red-50 text-red-700 p-6 rounded-lg border border-red-200 shadow-sm">
                <h3 className="text-lg font-semibold mb-2">Error Loading Shops</h3>
                <p>{error.message}</p>
            </div>
        );
    }

    // Ensure data is defined before accessing it
    if (!data) {
        return (
            <div className="flex items-center justify-center min-h-[400px] bg-gray-50 rounded-lg">
                <div className="text-lg font-medium text-gray-600">No shop data available</div>
            </div>
        );
    }

    // Extract unique locations for filter
    const locations = ["All", ...new Set(data.filter(shop => shop.location).map(shop => shop.location))];

    // Filter shops based on selected location and search term
    const filteredShops = data
        .filter(shop => filterLocation === "All" || shop.location === filterLocation)
        .filter(shop =>
            searchTerm === "" ||
            shop.shopName.toLowerCase().includes(searchTerm.toLowerCase()) ||
            shop.location.toLowerCase().includes(searchTerm.toLowerCase())
        );

    return (
        <div className="max-w-7xl mx-auto px-4 py-8">
            <div className="bg-gradient-to-r from-blue-600 to-indigo-700 rounded-xl shadow-lg p-6 mb-8">
                <h1 className="text-3xl font-bold text-white mb-2">Campus Food Directory</h1>
                <p className="text-blue-100 max-w-2xl">Find your favorite food shops across campus and explore their menu offerings</p>
            </div>

            {/* Filters and search */}
            <div className="bg-white rounded-lg shadow-md p-5 mb-8">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div className="flex items-center space-x-4 w-full md:w-auto">
                        <div className="w-full md:w-auto">
                            <label className="block text-sm font-medium text-gray-700 mb-1">Location Filter</label>
                            <select
                                className="w-full md:w-auto border border-gray-300 rounded-lg px-4 py-2.5 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                                value={filterLocation}
                                onChange={(e) => setFilterLocation(e.target.value)}
                            >
                                {locations.map(location => (
                                    <option key={location} value={location}>{location}</option>
                                ))}
                            </select>
                        </div>
                    </div>

                    <div className="relative w-full md:w-64">
                        <label className="block text-sm font-medium text-gray-700 mb-1">Search Shops</label>
                        <div className="relative">
                            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <Search size={18} className="text-gray-400" />
                            </div>
                            <input
                                type="text"
                                placeholder="Search by name or location..."
                                className="pl-10 pr-4 py-2.5 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                            />
                        </div>
                    </div>
                </div>
            </div>

            {/* Results summary */}
            <div className="flex justify-between items-center mb-6">
                <h2 className="text-xl font-semibold text-gray-800">Available Shops</h2>
                <div className="text-sm px-3 py-1 bg-blue-100 text-blue-800 rounded-full">
                    Showing {filteredShops.length} of {data.length} shops
                </div>
            </div>

            {/* No results message */}
            {filteredShops.length === 0 && (
                <div className="bg-gray-50 rounded-lg p-8 text-center">
                    <div className="text-gray-500 mb-2">No shops found matching your criteria</div>
                    <button
                        onClick={() => { setFilterLocation("All"); setSearchTerm(""); }}
                        className="text-blue-600 hover:text-blue-800 font-medium"
                    >
                        Clear filters
                    </button>
                </div>
            )}

            {/* Shop cards grid */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {filteredShops.map((shop) => (
                    <Shop key={shop.shopID} shopName={shop.shopName} location={shop.location} shopID={shop.shopID} telephone_No={shop.telephone_No} />
                ))}
            </div>
        </div>
    );
}

export default ShopList;