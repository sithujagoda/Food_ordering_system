import { Building, MapPin, Phone, ShoppingBag } from "lucide-react"
import { useNavigate } from "react-router";

interface props {
    shopName: string,
    location: string,
    shopID: string,
    telephone_No: string
}

function Shop({ shopName, location, shopID, telephone_No }: props) {

    const navigate = useNavigate();

    const handleClick = () => {
        navigate(`/shop/${shopID}`);
    };

    return (
        <div
            className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-all duration-300 border border-gray-100"
        >
            <div className="bg-gradient-to-r from-blue-500 to-blue-600 text-white p-5">
                <h2 className="text-xl font-semibold mb-1">{shopName}</h2>
                <div className="flex items-center text-blue-100">
                    <MapPin size={16} className="mr-1" />
                    <span className="text-sm">{location}</span>
                </div>
            </div>

            <div className="p-5">
                <div className="space-y-4">
                    <div className="flex items-center text-gray-700">
                        <Building size={20} className="mr-3 flex-shrink-0 text-blue-500" />
                        <div>
                            <div className="text-xs text-gray-500 mb-0.5">Shop ID</div>
                            <div className="font-medium">{shopID}</div>
                        </div>
                    </div>

                    <div className="flex items-center text-gray-700">
                        <Phone size={20} className="mr-3 flex-shrink-0 text-blue-500" />
                        <div>
                            <div className="text-xs text-gray-500 mb-0.5">Contact Number</div>
                            <div className="font-medium">{telephone_No}</div>
                        </div>
                    </div>
                </div>

                <div className="mt-6">
                    <button
                        onClick={handleClick}
                        className="w-full flex items-center justify-center bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white py-3 px-4 rounded-lg transition-all duration-300 font-medium shadow-sm"
                    >
                        <ShoppingBag size={18} className="mr-2" />
                        View Menu Items
                    </button>
                </div>
            </div>
        </div>
    )
}

export default Shop
