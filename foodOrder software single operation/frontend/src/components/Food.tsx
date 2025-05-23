import { Clock, Coffee, Info } from "lucide-react"

interface Props {
    FooditemID: string,
    name: string,
    price: string,
    description: string
}

function Food({ FooditemID, name, price, description }: Props) {
    return (
        <div
            className="bg-white rounded-lg shadow-sm overflow-hidden hover:shadow-md transition-all duration-300 border border-blue-100 flex flex-col md:flex-row"
        >
            {/* Food image placeholder - can be replaced with actual image */}
            <div className="bg-gradient-to-r from-blue-500 to-blue-600 w-full md:w-1/3 aspect-square md:aspect-auto flex items-center justify-center">
                <Coffee size={48} className="text-white" />
            </div>

            <div className="p-5 flex-1 flex flex-col justify-between">
                <div>
                    <div className="flex justify-between items-start mb-2">
                        <h2 className="text-xl font-semibold text-gray-800">{name}</h2>
                        <div className="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-medium">
                            Rs. {price}
                        </div>
                    </div>

                    <p className="text-gray-600 mb-4">{description}</p>

                    <div className="flex items-center text-gray-500 text-sm mb-4">
                        <Info size={14} className="mr-1 text-blue-400" />
                        <span>Item ID: {FooditemID}</span>
                    </div>
                </div>

                <div className="flex justify-between items-center">
                    <div className="flex items-center text-blue-400">
                        <Clock size={16} className="mr-1" />
                        <span className="text-sm">15-20 min</span>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Food
