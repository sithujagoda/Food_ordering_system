import { Route, Routes } from "react-router"
import ShopList from "./pages/ShopList"
import FoodList from "./pages/FoodList"
import { QueryClient, QueryClientProvider } from "@tanstack/react-query"

const queryClient = new QueryClient()

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <Routes>
        <Route path="/" element={<ShopList />} />
        <Route path="/shop/:shopId" element={<FoodList />} />
      </Routes>
    </QueryClientProvider>
  )
}

export default App
