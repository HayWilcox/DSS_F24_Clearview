-- -----------------------------------------------------
-- Drop Statements
-- -----------------------------------------------------
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS cust_order;
DROP TABLE IF EXISTS customer_address;
DROP TABLE IF EXISTS door;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS general_retract_control;
DROP TABLE IF EXISTS hale_door;
DROP TABLE IF EXISTS hale_screen_model;
DROP TABLE IF EXISTS mirage;
DROP TABLE IF EXISTS mirage_3500;
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS frame_size;
DROP TABLE IF EXISTS fastener;
DROP TABLE IF EXISTS mesh;
DROP TABLE IF EXISTS window;
DROP TABLE IF EXISTS new_window_screen;
DROP TABLE IF EXISTS order_log;
DROP TABLE IF EXISTS phantom;
DROP TABLE IF EXISTS rainier;
DROP TABLE IF EXISTS sunscreen;
DROP TABLE IF EXISTS view_guard;
DROP TABLE IF EXISTS wizard_smart_screen;
DROP TABLE IF EXISTS measurement;
DROP TABLE IF EXISTS nws_measurement;
DROP TABLE IF EXISTS rainier_color;
DROP TABLE IF EXISTS mirage_3500_mesh;
DROP TABLE IF EXISTS mirage_mesh;
DROP TABLE IF EXISTS mirage_3500_color;
DROP TABLE IF EXISTS mirage_color;
DROP TABLE IF EXISTS rainier_order;
DROP TABLE IF EXISTS mirage_order;
DROP TABLE IF EXISTS mirage_3500_order;
DROP TABLE IF EXISTS nws_order;

-- -----------------------------------------------------
-- Table address
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS address 
(
  address_id SERIAL,
  address_line1 CHARACTER VARYING NOT NULL,
  address_line2 CHARACTER VARYING NOT NULL,
  CONSTRAINT address_pk PRIMARY KEY (address_id)
);


-- -----------------------------------------------------
-- Table customer
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS customer 
(
  customer_id SERIAL,
  c_fname CHARACTER VARYING NOT NULL,
  c_lname CHARACTER VARYING NOT NULL,
  CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);


-- -----------------------------------------------------
-- Table order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS order 
(
  order_id SERIAL,
  order_date DATE NOT NULL,
  estimated_date DATE NOT NULL,
  actual_date DATE NULL DEFAULT NULL,
  estimated_cost REAL NOT NULL,
  actual_cost REAL NULL DEFAULT NULL,
  quantity INTEGER NOT NULL,
  CONSTRAINT order_pk PRIMARY KEY (order_id)
);


-- -----------------------------------------------------
-- Table cust_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS cust_order 
(
  cust_order_id SERIAL,
  customer_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT cust_order_pk PRIMARY KEY (cust_order_id),
  INDEX fk_cust_order_customer_idx (customer_id ASC) VISIBLE,
  INDEX fk_cust_order_order1_idx (order_id ASC) VISIBLE,
  CONSTRAINT cust_order_fk1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT cust_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table customer_address
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS customer_address 
(
  customer_address_id SERIAL,
  customer_id INTEGER NOT NULL,
  address_id INTEGER NOT NULL,
  CONSTRAINT cust_address_pk PRIMARY KEY (customer_address_id),
  INDEX fk_customer_address_customer1_idx (customer_id ASC) VISIBLE,
  INDEX fk_customer_address_address1_idx (address_id ASC) VISIBLE,
  CONSTRAINT fk_customer_address_address1
    FOREIGN KEY (address_id)
    REFERENCES address (address_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_address_customer1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS door 
(
  door_id SERIAL,
  slide_type CHARACTER VARYING NOT NULL,
  slide_color CHARACTER VARYING NOT NULL,
  wheels_num INTEGER NOT NULL,
  swing_type CHARACTER VARYING NOT NULL,
  swing_color CHARACTER VARYING NOT NULL,
  opening_side CHARACTER(2) NOT NULL,
  handle_style CHARACTER VARYING NOT NULL,
  CONSTRAINT door_pk PRIMARY KEY (door_id)
);


-- -----------------------------------------------------
-- Table employee
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS employee 
(
  employee_id SERIAL,
  e_fname CHARACTER VARYING NOT NULL,
  e_lname CHARACTER VARYING NOT NULL,
  access_type CHARACTER VARYING NOT NULL,
  CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);


-- -----------------------------------------------------
-- Table general_retract_control
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS general_retract_control 
(
  general_retract_control_id SERIAL,
  door_type CHARACTER VARYING NOT NULL,
  door_mount CHARACTER VARYING NOT NULL COMMENT 'In VS Surface\\n',
  opening_side CHARACTER VARYING NOT NULL,
  fraction CHARACTER VARYING NOT NULL,
  mesh CHARACTER VARYING NOT NULL,
  mohair CHARACTER VARYING NOT NULL,
  mohair_position CHARACTER VARYING NOT NULL,
  top_adapter CHARACTER VARYING NOT NULL,
  build_out CHARACTER VARYING NOT NULL,
  btm_adapter CHARACTER VARYING NOT NULL,
  btm_adapter_color CHARACTER VARYING NOT NULL,
  CONSTRAINT grc_pk PRIMARY KEY (general_retract_control_id)
);


-- -----------------------------------------------------
-- Table hale_door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_door 
(
  hale_door_id SERIAL,
  size CHARACTER VARYING NOT NULL,
  flap_config CHARACTER VARYING NOT NULL,
  door_color CHARACTER VARYING NOT NULL,
  sec_cover_load CHARACTER VARYING NOT NULL,
  second_ext_cover CHARACTER(1) NOT NULL,
  rain_cap CHARACTER(1) NOT NULL,
  flap CHARACTER(1) NOT NULL,
  thickness CHARACTER VARYING NOT NULL,
  CONSTRAINT hale_door_pk PRIMARY KEY (table_id)
);


-- -----------------------------------------------------
-- Table hale_screen_model
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_screen_model 
(
  hale_screen_model_id SERIAL,
  model_size CHARACTER VARYING NOT NULL,
  model_color CHARACTER VARYING NOT NULL,
  model_thickness CHARACTER VARYING NOT NULL,
  model_has_flap CHARACTER(2) NOT NULL,
  model_placement CHARACTER VARYING NOT NULL,
  CONSTRAINT hale_screen_model_pk PRIMARY KEY (hale_screen_model_id)
);


-- -----------------------------------------------------
-- Table mirage
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage 
(
  mirage_id SERIAL,
  mirage_build_out CHARACTER VARYING NOT NULL,
  CONSTRAINT mirage_pk PRIMARY KEY (mirage_id)
);


-- -----------------------------------------------------
-- Table mirage_3500
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500 
(
  mirage_3500_id SERIAL,
  mirage_3500_handle CHARACTER VARYING NOT NULL,
  CONSTRAINT mirage_3500_pk PRIMARY KEY (mirage_3500_id)
);


-- -----------------------------------------------------
-- Table color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS color 
(
  color_id SERIAL,
  color_name CHARACTER VARYING NOT NULL,
  CONSTRAINT color_pk PRIMARY KEY (color_id)
);


-- -----------------------------------------------------
-- Table frame_size
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS frame_size 
(
  frame_size_id SERIAL,
  size_type CHARACTER VARYING NOT NULL,
  CONSTRAINT frame_size_pk PRIMARY KEY (frame_size_id)
);


-- -----------------------------------------------------
-- Table fastener
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS fastener 
(
  fastener_id SERIAL,
  fastener_type CHARACTER VARYING NOT NULL,
  CONSTRAINT fastener_pk PRIMARY KEY (fastener_id)
);


-- -----------------------------------------------------
-- Table mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mesh 
(
  mesh_id SERIAL,
  mesh_type CHARACTER VARYING NOT NULL,
  CONSTRAINT mesh_pk PRIMARY KEY (mesh_id)
);


-- -----------------------------------------------------
-- Table window
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS window 
(
  window_id SERIAL,
  tab_spring CHARACTER VARYING NOT NULL,
  color_id INTEGER NOT NULL,
  frame_size_id INTEGER NOT NULL,
  fastener_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT window_pk PRIMARY KEY (window_id),
  INDEX window_fk1_idx (color_id ASC) VISIBLE,
  INDEX window_fk2_idx (frame_size_id ASC) VISIBLE,
  INDEX window_fk3_idx (fastener_id ASC) VISIBLE,
  INDEX window_fk4_idx (mesh_id ASC) VISIBLE,
  CONSTRAINT window_fk1
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT window_fk2
    FOREIGN KEY (frame_size_id)
    REFERENCES frame_size (frame_size_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT window_fk3
    FOREIGN KEY (fastener_id)
    REFERENCES fastener (fastener_id)
    ON UPDATE CASCADE,
    ON DELETE CASCADE
  CONSTRAINT window_fk4
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table new_window_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS new_window_screen 
(
  nws_id SERIAL,
  width_inch CHARACTER VARYING NOT NULL COMMENT 'in inches',
  height_inch CHARACTER VARYING NOT NULL COMMENT 'in inches',
  window_id INTEGER NOT NULL,
  CONSTRAINT nws_pk PRIMARY KEY (nws_id),
  INDEX nws_fk1_idx (window_id ASC) VISIBLE,
  CONSTRAINT nws_fk1
    FOREIGN KEY (window_id)
    REFERENCES window (window_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table order_log
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS order_log 
(
  order_log_id SERIAL,
  order_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  actual_date DATE NULL DEFAULT NULL,
  CONSTRAINT order_log_pk PRIMARY KEY (order_log_id),
  INDEX fk_order_log_order1_idx (order_id ASC) VISIBLE,
  INDEX fk_order_log_employee1_idx (employee_id ASC) VISIBLE,
  INDEX fk_order_log_customer1_idx (customer_id ASC) VISIBLE,
  CONSTRAINT order_log_fk1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT order_log_fk2
    FOREIGN KEY (employee_id)
    REFERENCES employee (employee_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT order_log_fk3
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table phantom
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS phantom 
(
  phantom_id SERIAL,
  phantom_color CHARACTER VARYING NOT NULL,
  phantom_build_out CHARACTER VARYING NOT NULL DEFAULT 'None',
  meshlock CHARACTER(1) NOT NULL,
  phantom_mesh CHARACTER VARYING(200) NOT NULL,
  meshlock_mesh CHARACTER VARYING(100) NOT NULL,
  type_of_screen CHARACTER VARYING(60) NOT NULL,
  screen_color CHARACTER VARYING NOT NULL,
  wood_type CHARACTER VARYING NOT NULL,
  mount CHARACTER VARYING NOT NULL,
  hembar CHARACTER VARYING NOT NULL,
  tracks CHARACTER VARYING NOT NULL,
  mesh CHARACTER VARYING NOT NULL,
  CONSTRAINT phantom_pk PRIMARY KEY (phantom_id)
);


-- -----------------------------------------------------
-- Table rainier
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier 
(
  rainier_id SERIAL,
  est_placement CHARACTER VARYING NULL,
  act_placement CHARACTER VARYING NULL,
  est_housing_series CHARACTER VARYING NULL DEFAULT NULL,
  act_housing_series CHARACTER VARYING NULL DEFAULT NULL,
  est_drive_side CHARACTER VARYING NULL DEFAULT NULL,
  act_drive_side CHARACTER VARYING NULL DEFAULT NULL,
  est_hembar CHARACTER VARYING NULL DEFAULT NULL,
  act_hembar CHARACTER VARYING NULL DEFAULT NULL,
  est_pilebrush CHARACTER VARYING NULL DEFAULT NULL,
  act_pilebrush CHARACTER VARYING NULL DEFAULT NULL,
  est_brush_location CHARACTER VARYING NULL DEFAULT NULL,
  act_brush_location CHARACTER VARYING NULL DEFAULT NULL,
  est_cord_length CHARACTER VARYING NULL DEFAULT NULL,
  act_cord_length CHARACTER VARYING NULL DEFAULT NULL,
  est_mount_type CHARACTER VARYING NULL DEFAULT NULL,
  act_mount_type CHARACTER VARYING NULL DEFAULT NULL,
  est_top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_top_level CHARACTER VARYING NULL DEFAULT NULL,
  act_bottom_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_bottom_level CHARACTER VARYING NULL DEFAULT NULL,
  act_left_opening_height CHARACTER VARYING NULL DEFAULT NULL,
  act_left_plumb CHARACTER VARYING NULL DEFAULT NULL,
  act_right_opening_height CHARACTER VARYING NULL DEFAULT NULL,
  act_right_plumb CHARACTER VARYING NULL DEFAULT NULL,
  est_left_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_left_buildout CHARACTER VARYING NULL DEFAULT NULL,
  est_right_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_right_buildout CHARACTER VARYING NULL DEFAULT NULL,
  est_add_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_add_buildout CHARACTER VARYING NULL DEFAULT NULL,
  est_left_track CHARACTER VARYING NULL DEFAULT NULL,
  act_left_track CHARACTER VARYING NULL DEFAULT NULL,
  est_right_track CHARACTER VARYING NULL DEFAULT NULL,
  act_right_track CHARACTER VARYING NULL DEFAULT NULL,
  act_starting_point CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT rainier_pk PRIMARY KEY (rainier_id)
);


-- -----------------------------------------------------
-- Table sunscreen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS sunscreen 
(
  sunscreen_id SERIAL,
  cast_clip CHARACTER VARYING(5) NOT NULL,
  CONSTRAINT susnscreen_pk PRIMARY KEY (sunscreen_id)
);


-- -----------------------------------------------------
-- Table view_guard
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS view_guard 
(
  viewguard_id SERIAL,
  handle_color CHARACTER VARYING(10) NOT NULL,
  door_type CHARACTER VARYING(10) NOT NULL,
  number_of_slides INTEGER NOT NULL,
  color CHARACTER VARYING(10) NOT NULL,
  handle_style CHARACTER VARYING NOT NULL,
  deadbolt CHARACTER VARYING NOT NULL,
  CONSTRAINT viewguard_pk PRIMARY KEY (viewguard_id)
);


-- -----------------------------------------------------
-- Table wizard_smart_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS wizard_smart_screen 
(
  wizard_smart_screen_id SERIAL,
  location_on_house CHARACTER VARYING NOT NULL,
  placement CHARACTER VARYING NOT NULL,
  color CHARACTER VARYING NOT NULL,
  fabric_type CHARACTER VARYING NOT NULL,
  housing_size CHARACTER VARYING NOT NULL,
  drive_side CHARACTER VARYING NOT NULL,
  bottom_seal CHARACTER VARYING NOT NULL,
  zipper_color CHARACTER VARYING NOT NULL,
  probe_color CHARACTER VARYING NOT NULL,
  cable_length CHARACTER VARYING NOT NULL,
  top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  top_level CHARACTER VARYING NOT NULL,
  bottom_opening_width CHARACTER VARYING NOT NULL,
  bottom_level CHARACTER VARYING NOT NULL,
  left_opening_height CHARACTER VARYING NOT NULL,
  left_plump CHARACTER VARYING NOT NULL,
  right_opening_height CHARACTER VARYING NOT NULL,
  right_plump CHARACTER VARYING NOT NULL,
  two_by_two_angle CHARACTER VARYING NOT NULL,
  track_type CHARACTER VARYING NOT NULL,
  track_punched CHARACTER VARYING NOT NULL,
  starting_poINTEGER CHARACTER VARYING NULL DEFAULT NULL,
  order_width CHARACTER VARYING NOT NULL,
  order_height CHARACTER VARYING NOT NULL,
  CONSTRAINT wss_pk PRIMARY KEY (wizard_smart_screen_id)
);


-- -----------------------------------------------------
-- Table measurement
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS measurement 
(
  measurement_id SERIAL,
  measurement_name CHARACTER VARYING NOT NULL,
  CONSTRAINT measurement_pk PRIMARY KEY (measurement_id)
);


-- -----------------------------------------------------
-- Table nws_measurement
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS nws_measurement 
(
  nws_measurement_id SERIAL,
  measurement_id INTEGER NOT NULL,
  nws_id INTEGER NOT NULL,
  width_fraction CHARACTER(1) NULL,
  width_plus_minus CHARACTER(1) NULL,
  height_fraction CHARACTER(1) NULL,
  height_plus_minus CHARACTER(1) NULL,
  CONSTRAINT nws_measurement_pk PRIMARY KEY (nws_measurement_id),
  INDEX nws_measurement_fk1_idx (measurement_id ASC) VISIBLE,
  INDEX nws_measurement_fk2_idx (nws_id ASC) VISIBLE,
  CONSTRAINT nws_measurement_fk1
    FOREIGN KEY (measurement_id)
    REFERENCES measurement (measurement_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT nws_measurement_fk2
    FOREIGN KEY (nws_id)
    REFERENCES new_window_screen (nws_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table rainier_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier_color 
(
  rainier_color_id SERIAL,
  rainier_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  est_hardware_color CHARACTER(1) NULL,
  act_hardware_color CHARACTER(1) NULL,
  est_fabric_color CHARACTER(1) NULL,
  act_fabric_color CHARACTER(1) NULL,
  est_zipper_color CHARACTER(1) NULL DEFAULT NULL,
  act_zipper_color CHARACTER(1) NULL DEFAULT NULL,
  CONSTRAINT ranier_color_pk PRIMARY KEY (rainier_color_id),
  INDEX rainier_color_fk1_idx (rainier_id ASC) VISIBLE,
  INDEX rainier_color_fk2_idx (color_id ASC) VISIBLE,
  CONSTRAINT rainier_color_fk1
    FOREIGN KEY (rainier_id)
    REFERENCES rainier (rainier_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_3500_mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_mesh 
(
  mirage_3500_mesh_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_mesh_pk PRIMARY KEY (mirage_3500_mesh_id),
  INDEX mirage_3500_mesh_fk1_idx (mirage_3500_id ASC) VISIBLE,
  INDEX mirage_3500_mesh_fk2_idx (mesh_id ASC) VISIBLE,
  CONSTRAINT mirage_3500_mesh_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_mesh_fk2
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_mesh 
(
  mirage_mesh_id SERIAL,
  mirage_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT mirage_mesh_pk PRIMARY KEY (mirage_mesh_id),
  INDEX mirage_mesh_fk1_idx (mirage_id ASC) VISIBLE,
  INDEX mirage_mesh_fk2_idx (mesh_id ASC) VISIBLE,
  CONSTRAINT mirage_mesh_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_mesh_fk2
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_3500_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_color 
(
  mirage_3500_color_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_color_pk PRIMARY KEY (mirage_3500_color_id),
  INDEX mirage_3500_color_fk1_idx (mirage_3500_id ASC) VISIBLE,
  INDEX mirage_3500_color_fk2_idx (color_id ASC) VISIBLE,
  CONSTRAINT mirage_3500_color_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_color 
(
  mirage_color_id SERIAL,
  mirage_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  mirage_color CHARACTER(1) NULL,
  pivot_pro_color CHARACTER(1) NULL,
  CONSTRAINT mirage_color_pk PRIMARY KEY (mirage_color_id),
  INDEX mirage_color_fk1_idx (mirage_id ASC) VISIBLE,
  INDEX mirage_color_fk2_idx (color_id ASC) VISIBLE,
  CONSTRAINT mirage_color_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table rainier_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier_order
(
  rainier_order_id SERIAL,
  rainier_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT rainier_order_pk PRIMARY KEY (rainier_order_id),
  INDEX fk_rainier_order_rainier1_idx (rainier_id ASC) VISIBLE,
  INDEX fk_rainier_order_order1_idx (order_id ASC) VISIBLE,
  CONSTRAINT rainier_order_fk1
    FOREIGN KEY (rainier_id)
    REFERENCES rainier (rainier_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table mirage_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_order
(
  mirage_order_id SERIAL,
  mirage_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT mirage_order_pk PRIMARY KEY (mirage_order_id),
  INDEX fk_mirage_order_mirage1_idx (mirage_id ASC) VISIBLE,
  INDEX fk_mirage_order_order1_idx (order_id ASC) VISIBLE,
  CONSTRAINT mirage_order_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table mirage_3500_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_order
(
  mirage_3500_order_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_order_pk PRIMARY KEY (mirage_3500_order_id),
  INDEX fk_mirage_3500_order_mirage_35001_idx (mirage_3500_id ASC) VISIBLE,
  INDEX fk_mirage_3500_order_order1_idx (order_id ASC) VISIBLE,
  CONSTRAINT mirage_3500_order_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table nws_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS nws_order
(
  nws_order_id SERIAL,
  nws_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT nws_order_pk PRIMARY KEY (nws_order_id),
  INDEX fk_nws_order_nws1_idx (nws_id ASC) VISIBLE,
  INDEX fk_nws_order_order1_idx (order_id ASC) VISIBLE,
  CONSTRAINT nws_order_fk1
    FOREIGN KEY (nws_id)
    REFERENCES new_window_screen (nws_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT nws_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table phantom_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table view_guard_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table wizard_smart_screen_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table sunscreen_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table general_retract_control_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table hale_door_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table hale_screen_model_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table door_order
-- -----------------------------------------------------
