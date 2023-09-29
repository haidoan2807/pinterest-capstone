import { diskStorage } from 'multer';
import { extname, join } from 'path';

export const multerConfig = {
  storage: diskStorage({
    destination: join(__dirname, '..', 'uploads'),
    filename: (req, file, callback) => {
      const name = Date.now() + extname(file.originalname);
      callback(null, name);
    },
  }),
};
