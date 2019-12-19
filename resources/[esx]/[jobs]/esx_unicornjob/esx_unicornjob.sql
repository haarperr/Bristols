SET unicorn = 'unicorn';
SET society_unicorn = 'society_unicorn';
SET UnicoRn = 'Unicorn';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (society_unicorn, UnicoRn, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (society_unicorn, UnicoRn, 1),
  ('society_unicorn_fridge', 'Unicorn (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (society_unicorn, UnicoRn, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (unicorn, UnicoRn, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (unicorn, 0, 'barman', 'Barman', 300, '{}', '{}'),
  (unicorn, 1, 'dancer', 'Danseur', 300, '{}', '{}'),
  (unicorn, 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
  (unicorn, 3, 'boss', 'Gérant', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('jager', 'Jägermeister', 5),
    ('martini', 'Martini blanc', 5),
    ('soda', 'Soda', 5),
    ('jusfruit', 'Jus de fruits', 5),
    ('icetea', 'Ice Tea', 5),
    ('energy', 'Energy Drink', 5),
    ('drpepper', 'Dr. Pepper', 5),
    ('limonade', 'Limonade', 5),
    ('bolcacahuetes', 'Bol de cacahuètes', 5),
    ('bolnoixcajou', 'Bol de noix de cajou', 5),
    ('bolpistache', 'Bol de pistaches', 5),
    ('bolchips', 'Bol de chips', 5),
    ('saucisson', 'Saucisson', 5),
    ('grapperaisin', 'Grappe de raisin', 5),
    ('jagerbomb', 'Jägerbomb', 5),
    ('golem', 'Golem', 5),
    ('whiskycoca', 'Whisky-coca', 5),
    ('vodkaenergy', 'Vodka-energy', 5),
    ('vodkafruit', 'Vodka-jus de fruits', 5),
    ('rhumfruit', 'Rhum-jus de fruits', 5),
    ('teqpaf', "Teq'paf", 5),
    ('rhumcoca', 'Rhum-coca', 5),
    ('mojito', 'Mojito', 5),
    ('ice', 'Glaçon', 5),
    ('mixapero', 'Mix Apéritif', 3),
    ('metreshooter', 'Mètre de shooter', 3),
    ('jagercerbere', 'Jäger Cerbère', 3),
    ('menthe', 'Feuille de menthe', 10)
;
