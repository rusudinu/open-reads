import {Book} from "./Book";

export interface User {
  username: string;
  name: string;
  description: string;
  lastActionTimeStamp: number;
  currentlyReading: Book[];
  friendsList: User[];
  read: Book[];
  wantToRead: Book[];
  profileImageURL: string;
}

