import {Book} from "./Book";

export interface User {
  id: number;
  name: string;
  description: string;
  last_active: number;
  currently_reading: Book[];
  photo_url: string;
}

