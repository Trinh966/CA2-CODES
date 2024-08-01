
const express = require('express');
const mysql = require('mysql2');
const session = require('express-session'); // Import express-session
const MySQLStore = require('express-mysql-session')(session);
const app = express();
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'skincare'
});
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});
const sessionStore = new MySQLStore({
  expiration: 86400000, 
  endConnectionOnClose: false 
}, connection);
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: false }));
app.use(session({
  secret: 'your_secret_here', 
  resave: false,
  saveUninitialized: false,
  store: sessionStore, 
  cookie: {
    maxAge: 1000 * 60 * 60 * 24 
  }
}));


//HOMEPAGE
app.get("/", (req, res) => {
  res.render("index");
});

// CRUD operations for ingredients
app.get('/ingredients', (req, res) => {
  const sql = 'SELECT * FROM ingredients';//define querry--Execute 
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.render('ingredients/index', { ingredients: results });
  });
});
app.get('/ingredients/:id', (req, res) => {
  const ingredientId = req.params.id;
  const sql = 'SELECT * FROM ingredients WHERE id = ?';
  connection.query(sql, [ingredientId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length === 0) {
      res.status(404).send('Ingredient not found');
      return;
    }
    res.render('ingredients/show', { ingredient: results[0] });
  });
})
app.get('/addingredients', (req, res) => {
  res.render('ingredients/add');
});
app.post('/addingredients', (req, res) => {
  const { name, description, benefits, skin_types,utilization,side_effects } = req.body;
  const sql = 'INSERT INTO ingredients (name, description, benefits, skin_types,utilization ,side_effects) VALUES (?, ?, ?, ?,?,?)';
  connection.query(sql, [name, description, benefits, skin_types,utilization,side_effects], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    console.log('New ingredient added:', results);
    res.redirect('/ingredients');
  });
});
app.get('/editingredient/:id', (req, res) => {
  const ingredientId = req.params.id;
  const sql = 'SELECT * FROM ingredients WHERE id = ?';
  connection.query(sql, [ingredientId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      res.render('ingredients/edit', { ingredient: results[0] });
    } else {
      res.status(404).send('Ingredient not found');
    }
  });
});
app.post('/editingredient/:id', (req, res) => {
  const ingredientId = req.params.id;
  const { name, description, benefits, skin_types,utilization,side_effects } = req.body;
  const sql = 'UPDATE ingredients SET name = ?, description = ?, benefits = ?, skin_types = ?,utilization = ?,side_effects = ? WHERE id = ?';
  connection.query(sql, [name, description, benefits, skin_types,utilization,side_effects, ingredientId], (error, results) => {
    if (error) {
      console.error('Error updating ingredient:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    
    res.redirect('/ingredients');
  });
});
app.get('/ingredients/delete/:id', (req, res) => {
  const ingredientId = req.params.id;
  const sql = 'DELETE FROM ingredients WHERE id = ?';
  connection.query(sql, [ingredientId], (error, results) => {
    if (error) {
      console.error('Error deleting ingredient:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.redirect('/ingredients');
  });
});




// CRUD operations for products
app.get('/products', (req, res) => {
  const sql = 'SELECT * FROM skincare_db'; //Variable Creation: const sql creates a variable named sql.
  //SQL Query: The variable sql contains a string with an SQL query to fetch data, but it does not store the data itself.
  connection.query(sql, (error, results) => { //execute sql query
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
   }
    res.render('products/products', { products: results }); //view template
  });
});
app.get('/product/:id', (req, res) => { //URL PR
  const productId = req.params.id;
  const sql = 'SELECT * FROM skincare_db WHERE product_id = ?';
  connection.query(sql, [productId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      res.render('products/product', { product: results[0] }); //aray
    } else {
      res.status(404).send('Product not found');
    }
  });
});
//When a GET request is made to /addproduct, this route renders a
// view template named addproduct located in the products directory.
app.get('/addproduct', (req, res) => {
  res.render('products/addproduct');
});
app.post('/addproduct', (req, res) => {
  const { name, brand, type, skin_type, concerns, ingredients,instructions,price,volume_ml,image } = req.body;
  const sql = 'INSERT INTO skincare_db (name, brand, type, skin_type, concerns, ingredients,instructions,price,volume_ml,image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)';
  connection.query(sql, [name,brand,type,skin_type,concerns,ingredients,instructions,price,volume_ml,image], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    console.log('New product added:', results);
    res.redirect('/products');
  });
});
app.get('/editproduct/:id', (req, res) => {
  const productId = req.params.id;
  const sql = 'SELECT * FROM skincare_db WHERE product_id = ?';
  connection.query(sql, [productId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      res.render('products/editproduct', { product: results[0] });
    } else {
      res.status(404).send('Product not found');
    }
  });
});
app.post('/editproduct/:id', (req, res) => {
  const productId = req.params.id;
  const { name, brand, type, skin_type, concerns, ingredients,instructions,price,volume_ml } = req.body;
  const sql = 'UPDATE skincare_db SET name=?,brand=?,type=?,skin_type=?,concerns=?,ingredients=?,instructions=?,price=?,volume_ml=? WHERE product_id = ?';
  connection.query(sql, [name,brand,type,skin_type,concerns,ingredients,instructions,price,volume_ml, productId], (error, results) => {
    if (error) {
      console.error('Error updating product:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.redirect('/products');
  });
});
app.get('/deleteproduct/:id', (req, res) => {
  const productId = req.params.id;
  const sql = 'DELETE FROM skincare_db WHERE product_id = ?';
  connection.query(sql, [productId], (error, results) => {
    if (error) {
      console.error('Error deleting query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.redirect('/products');
  });
});


//CRUD operations for users

app.get('/signup', (req, res) => {
  res.render('user/signup');
});
app.post('/signup', (req, res) => {
  const { username, email, password, skin_type, concerns, objectives, allergies } = req.body;
  const sql = 'INSERT INTO users (username, email, password, skin_type, concerns, objectives, allergies) VALUES (?, ?, ?, ?, ?, ?, ?)';
  connection.query(sql, [username, email, password, skin_type, concerns, objectives, allergies], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    console.log('User registered successfully:', results);
    res.redirect('/login');
  });
});
app.get('/login', (req, res) => {
  res.render('user/login');
});
app.post('/login', (req, res) => {
  const { email, password } = req.body;
  const sql = 'SELECT * FROM users WHERE email = ? AND password = ?';
  connection.query(sql, [email, password], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      req.session.user = results[0];
      res.redirect('/profile');
    } else {
      res.redirect('/login');
    }
  });
});
app.get('/profile', (req, res) => {
  if (!req.session.user) {
    res.redirect('/login');
  } else {
    res.render('user/profile', { user: req.session.user });
  }
});
app.get('/editprofile', (req, res) => {
  if (!req.session.user) {
    res.redirect('/login');
  } else {
    res.render('user/editprofile', { user: req.session.user });
  }
});
app.post('/editprofile', (req, res) => {
  if (!req.session.user) {
    res.redirect('/login');
  } else {
    const userId = req.session.user.id;
    const { username, email, skin_type, concerns, objectives, allergies } = req.body;
    const sql = 'UPDATE users SET username=?, email=?, skin_type=?, concerns=?, objectives=?, allergies=? WHERE id = ?';
    connection.query(sql, [username, email, skin_type, concerns, objectives, allergies, userId], (error, results) => {
      if (error) {
        console.error('Error updating user:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
      req.session.user = { ...req.session.user, username, email, skin_type, concerns, objectives, allergies };
      res.redirect('/profile');
    });
  }
});





// Progress Tracking Routes
app.get('/progress', (req, res) => {
  const sql = 'SELECT * FROM progress_entries ORDER BY date DESC';
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.render('progress/index', { entries: results });
  });
});
app.get('/progress/:id', (req, res) => {
  const entryId = req.params.id;
  const sql = 'SELECT * FROM progress_entries WHERE id = ?';
  connection.query(sql, [entryId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      res.render('progress/show', { entry: results[0] });
    } else {
      res.status(404).send('Progress entry not found');
    }
  });
});
app.get('/addprogress', (req, res) => {
  res.render('progress/add');
});
app.post('/addprogress', (req, res) => {
  const { date, skin_condition, products_used, notes } = req.body;
  const sql = 'INSERT INTO progress_entries (date, skin_condition, products_used, notes) VALUES (?, ?, ?, ?)';
  connection.query(sql, [date, skin_condition, products_used, notes], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    console.log('New progress entry added:', results);
    res.redirect('/progress');
  });
});
app.get('/editprogress/:id', (req, res) => {
  const entryId = req.params.id;
  const sql = 'SELECT * FROM progress_entries WHERE id = ?';
  connection.query(sql, [entryId], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results.length > 0) {
      res.render('progress/edit', { entry: results[0] });
    } else {
      res.status(404).send('Progress entry not found');
    }
  });
});
app.post('/editprogress/:id', (req, res) => {
  const entryId = req.params.id;
  const { date, skin_condition, products_used, notes } = req.body;
  const sql = 'UPDATE progress_entries SET date = ?, skin_condition = ?, products_used = ?, notes = ? WHERE id = ?';
  connection.query(sql, [date, skin_condition, products_used, notes, entryId], (error, results) => {
    if (error) {
      console.error('Error updating progress entry:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.redirect('/progress');
  });
});
app.get('/progress/delete/:id', (req, res) => {
  const entryId = req.params.id;
  const sql = 'DELETE FROM progress_entries WHERE id = ?';
  connection.query(sql, [entryId], (error, results) => {
    if (error) {
      console.error('Error deleting progress entry:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.redirect('/progress');
  });
});


app.get('/about', (req, res) => {
  res.render('about');
});

app.get('/privacy', (req, res) => {
  res.render('privacypolicy');
});

app.get('/termsofservice', (req, res) => {
  res.render('termsofservice');
});


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));