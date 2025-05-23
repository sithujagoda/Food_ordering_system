import { useQuery } from "@tanstack/react-query";
import { useParams, Link } from "react-router";
import { fetchFoodItems } from "../lib/data-services";
import { ChevronLeft, Coffee } from "lucide-react";
import Food from "../components/Food";

// Define the FoodItem interface
interface FoodItem {
    FooditemID: string;
    shopID: string;
    name: string;
    price: string;
    description: string;
}

function FoodList() {
    const { shopId } = useParams();
    const { data, isPending, isError, error } = useQuery<FoodItem[], Error>({
        queryKey: ['foods', shopId],
        queryFn: () => fetchFoodItems(shopId!)
    });

    if (isPending) {
        return (
            <div className="flex items-center justify-center min-h-[400px] bg-blue-50 rounded-lg">
                <div className="flex flex-col items-center">
                    <div className="w-16 h-16 border-4 border-blue-300 border-t-transparent rounded-full animate-spin mb-4"></div>
                    <div className="text-lg font-medium text-blue-600">Loading food items...</div>
                </div>
            </div>
        );
    }

    if (isError) {
        return (
            <div className="bg-red-50 text-red-600 p-6 rounded-lg border border-red-100 shadow-sm">
                <h3 className="text-lg font-semibold mb-2">Error Loading Food Items</h3>
                <p>{error.message}</p>
            </div>
        );
    }

    // Ensure data is defined before accessing it
    if (!data || data.length === 0) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[400px] bg-blue-50 rounded-lg p-8">
                <Coffee size={48} className="text-blue-400 mb-4" />
                <div className="text-lg font-medium text-blue-600 mb-2">No food items available</div>
                <p className="text-blue-500 text-center max-w-md">This shop hasn't added any menu items yet.</p>
                <Link to="/shops" className="mt-4 text-indigo-500 hover:text-indigo-600 font-medium flex items-center">
                    <ChevronLeft size={16} className="mr-1" /> Back to shops
                </Link>
            </div>
        );
    }

    // Find shop name from the first food item
    const shopName = data[0]?.shopID || shopId;

    return (
        <div className="max-w-7xl mx-auto px-4 py-8">
            {/* Header section */}
            <div className="bg-gradient-to-r from-blue-600 to-indigo-700 rounded-xl shadow-md p-6 mb-8">
                <div className="flex items-center">
                    <Link to="/" className="text-white hover:text-blue-100 mr-4">
                        <ChevronLeft size={24} />
                    </Link>
                    <div>
                        <h1 className="text-3xl font-bold text-white mb-1">Menu Items</h1>
                        <p className="text-blue-50">Explore delicious offerings from {shopName}</p>
                    </div>
                </div>
            </div>

            {/* Results count */}
            <div className="flex justify-between items-center mb-6">
                <h2 className="text-xl font-semibold text-blue-700">Available Items</h2>
                <div className="text-sm px-3 py-1 bg-blue-100 text-blue-700 rounded-full">
                    {data.length} items available
                </div>
            </div>

            {/* Food items grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                {data.map((item) => (
                    <Food key={item.FooditemID} FooditemID={item.FooditemID} name={item.name} price={item.price} description={item.description} />
                ))}
            </div>

            {/* Back to shop list link */}
            <div className="text-center mt-10">
                <Link to="/" className="text-indigo-500 hover:text-indigo-600 font-medium flex items-center justify-center">
                    <ChevronLeft size={16} className="mr-1" /> Back to all shops
                </Link>
            </div>
        </div>
    );
}

export default FoodList;