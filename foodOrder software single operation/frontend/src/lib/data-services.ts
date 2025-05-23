import axios from "axios";

const EXPRESS_API_URL = import.meta.env.VITE_BASE_URL;

export async function fetchAllShops() {
  const res = await axios.get(`${EXPRESS_API_URL}/shops/get`);
  return res.data.data;
}

export async function fetchFoodItems(shopID: string) {
  const res = await axios.get(`${EXPRESS_API_URL}/foods/get/${shopID}`);
  return res.data.data;
}
