-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 05:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skincare`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `skin_types` text DEFAULT NULL,
  `utilization` text DEFAULT NULL,
  `side_effects` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `description`, `benefits`, `skin_types`, `utilization`, `side_effects`) VALUES
(16, 'Hyaluronic Acid', ' A natural substance found in the skin that retains water, keeping it hydrated and plump', 'Hydrates, plumps skin, reduces the appearance of fine lines and wrinkles.', 'Best for dry skin, can be irritating for sensitive skin.', 'Found in moisturizers, serums, and masks.', 'Rarely causes irritation; sensitive individuals might experience redness.\r\n'),
(17, 'Retinol (Vitamin A)', 'Vitamin A derivative that promotes skin renewal and enhances collagen production.', 'Improves skin texture, reduces wrinkles, fades dark spots.', 'Best for aging, acne-prone, and sun-damaged skin; can be irritating for sensitive skin.', ' Found in anti-aging creams, serums, and treatments', 'Initial dryness and irritation; increases sensitivity to sunlight.'),
(18, ' Niacinamide (Vitamin B3)', 'Vitamin B3 that improves skin barrier function and reduces inflammation.', 'Minimizes pores, regulates oil production, brightens skin tone.', ' Suitable for all skin types, including sensitive and acne-prone skin.', 'Found in serums, moisturizers, and spot treatments.', ' Rare; may cause mild irritation in sensitive individuals.\r\n'),
(19, 'Salicylic Acid', 'Beta-hydroxy acid that exfoliates skin and unclogs pores.', 'Treats acne, reduces inflammation, removes dead skin cells.', 'Ideal for oily and acne-prone skin; use with caution on sensitive skin.', 'Found in cleansers, toners, and acne treatments.', 'Dryness, irritation, and increased sun sensitivity.'),
(20, 'Vitamin C (L-Ascorbic Acid)', 'Antioxidant that brightens skin, boosts collagen production, and protects against free radicals.', 'Evens out skin tone, reduces dark spots, improves firmness.', ' Suitable for most skin types; avoid high concentrations for sensitive skin.', 'Found in serums, moisturizers, and masks.', 'Rare; may cause mild irritation or tingling.'),
(21, 'Aloe Vera', 'Plant extract known for its soothing and healing properties.', ' Calms inflammation, hydrates, accelerates wound healing.', 'Suitable for sensitive and irritated skin', ' Found in gels, creams, and moisturizers.', 'Rare allergic reactions; generally safe for topical use.');

-- --------------------------------------------------------

--
-- Table structure for table `progress_entries`
--

CREATE TABLE `progress_entries` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `skin_condition` varchar(255) NOT NULL,
  `products_used` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_entries`
--

INSERT INTO `progress_entries` (`id`, `date`, `skin_condition`, `products_used`, `notes`, `created_at`) VALUES
(5, '2024-06-29', 'Clear with a few blemishes', 'Cleanser: CeraVe Hydrating Cleanser; Toner: Thayers Witch Hazel Toner; Serum: The Ordinary; Niacinamide 10% + Zinc 1%; Moisturizer: Neutrogena Hydro Boost Water Gel\r\n- Sunscreen: La Roche-Posay Anthelios Melt-in Milk Sunscreen SPF 60', 'Noticed slight improvement in overall skin texture. Redness around the nose area reduced. Skin feels hydrated and smooth.', '2024-07-16 10:23:35'),
(6, '2024-07-01', 'Dry and flaky', 'Cleanser: Vanicream Gentle Facial Cleanser;\r\nToner: Klairs Supple Preparation Unscented Toner;\r\nSerum: Hyaluronic Acid 2% + B5 from The Ordinary;\r\nMoisturizer: CeraVe Moisturizing Cream;\r\nSunscreen: EltaMD UV Clear Broad-Spectrum SPF 46;', 'Skin is feeling tight and flaky, especially on the forehead and cheeks.\r\nAdded extra layer of moisturizer to combat dryness.\r\nNo new breakouts.', '2024-07-16 10:26:17'),
(7, '2024-07-16', 'Oily with breakouts.', 'Cleanser: La Roche-Posay Effaclar Purifying Foaming Gel;\r\nToner: Paula\'s Choice Skin Perfecting 2% BHA Liquid Exfoliant;\r\nSerum: The Ordinary Salicylic Acid 2% Solution;\r\nMoisturizer: Neutrogena Oil-Free Moisturizer;\r\nSunscreen: Supergoop! Unseen Sunscreen SPF 40', 'Skin feels very oily by midday.\r\nNew breakouts on the chin and forehead.\r\nConsidering changing the serum to something less harsh.', '2024-07-16 10:26:51'),
(8, '2024-07-16', 'Sensitive with redness', 'Cleanser: Aveeno Ultra-Calming Foaming Cleanser;\r\nToner: Fresh Rose Deep Hydration Facial Toner;\r\nSerum: Avene Hydrance Intense Rehydrating Serum;\r\nMoisturizer: Eucerin Redness Relief Night Creme;\r\nSunscreen: La Roche-Posay Anthelios Mineral Zinc Oxide Sunscreen SPF 50', 'Skin feels irritated and has noticeable redness around cheeks and nose.\r\nAvoided any harsh treatments or exfoliants.\r\nApplied an extra layer of moisturizer to soothe the skin.', '2024-07-16 10:27:29'),
(12, '2024-07-09', 'Clear, with minor dry patches around cheeks.', 'Cleanser: Cetaphil Gentle Skin Cleanser;\r\nToner: Thayers Witch Hazel Toner;\r\nSerum: The Ordinary Hyaluronic Acid 2% + B5;\r\nMoisturizer: CeraVe Facial Moisturizing Lotion PM', 'Noticed slight improvement in hydration levels. Dry patches seem less noticeable. No new breakouts observed.', '2024-07-17 07:13:49'),
(13, '2024-06-29', 'Mild breakout on chin area, otherwise smooth and hydrated', 'Cleanser: La Roche-Posay Effaclar Purifying Foaming Gel;\r\nExfoliant: Paula\'s Choice 2% BHA Liquid Exfoliant;\r\nSerum: The Ordinary Niacinamide 10% + Zinc 1%;\r\nSpot Treatment: Mario Badescu Drying Lotion;\r\nMoisturizer: Neutrogena Hydro Boost Water Gel;', 'Breakout on chin appears to be reducing. Skin feels smoother after exfoliation. No irritation observed from spot treatment.', '2024-07-17 07:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `routine`
--
-- Error reading structure for table skincare.routine: #1932 - Table 'skincare.routine' doesn't exist in engine
-- Error reading data for table skincare.routine: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `skincare`.`routine`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('4yyWeAk75TieQkWRGwKpGzQq2TGSecux', 1721315515, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2024-07-18T15:09:08.080Z\",\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":18,\"username\":\"MAI123123\",\"email\":\"23008805@myrp.edu.sg\",\"skin_type\":\"Normal\",\"concerns\":\"1231\",\"objectives\":\"1231\",\"allergies\":\"12312\",\"password\":\"123123\"}}'),
('ftWn2pU0Q4TSPabckPq_detYdXAZ1ts0', 1721280229, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2024-07-17T05:32:19.547Z\",\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"username\":\"seah wee ling\",\"email\":\"23008805@myrp.edu.sg\",\"skin_type\":\"oily\",\"concerns\":\"idk\",\"objectives\":\"asd\",\"allergies\":\"none\",\"password\":\"$2b$10$aALMsbn4dr0R859Fz3DtJu53VFF4fHX64a9VflBW9vy5zPsHs3Hz2\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `skincare_db`
--

CREATE TABLE `skincare_db` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `skin_type` varchar(255) DEFAULT NULL,
  `concerns` text DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `volume_ml` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skincare_db`
--

INSERT INTO `skincare_db` (`product_id`, `name`, `brand`, `type`, `skin_type`, `concerns`, `ingredients`, `instructions`, `price`, `volume_ml`, `image`) VALUES
(9, 'Herbivore Botanicals Prism Exfoliating Glow Serum ', 'Herbivore Botanicals', 'Serum', 'All Skin Types', 'Exfoliation, Glow', 'Willow Bark Extract, Rose Water, Aloe Vera', 'Apply 4-8 drops to clean skin and gently massage in.', 54.00, 50, 'https://s3.r29static.com/bin/shop/cb3/x,80/2206314/image.jpg'),
(10, 'Glow Recipe Watermelon Glow PHA + BHA Pore-Tight Toner', 'Glow Recipe', 'Toner', 'All Skin Types', 'Pores, Dullness, Uneven Texture', 'Watermelon Extract, Hyaluronic Acid, PHA, BHA, Cactus Water', 'After cleansing, dispense a small amount into your palms and gently press into your face and neck until fully absorbed. Can be used daily, morning and night.', 34.00, 150, 'https://media.allure.com/photos/5e9751b57ec6230008fdcfc8/16:9/w_2560%2Cc_limit/Glow%2520Recipe%2520Watermelon%2520Glow%2520PHA%2520+%2520BHA%2520Pore-Tight%2520Toner%2520with%2520watermelon%2520slices%2520and%2520cactus.jpg'),
(11, 'Laneige Water Bank Hydro Essence', 'Laneige', 'Essence', 'All Skin Types', 'Hydration, Fine Lines, Dryness', 'Green Mineral Water, Kale, Garden Cress', 'Apply after toner, gently pat onto skin until fully absorbed. Use morning and night.', 39.00, 70, 'https://www.laneige.com/sg/en/resource/img/product/wbhendetail-01.png'),
(12, 'Glow Recipe Watermelon Glow Sleeping Mask', 'Glow Recipe', 'Sleeping Mask', 'All Skin Types', ' Hydration, Brightening', 'Watermelon Extract, Hyaluronic Acid, AHA', ' Apply a generous layer to clean skin before bed, rinse off in the morning.', 45.00, 80, 'https://bloganchoi.com/wp-content/uploads/2019/07/watermelon-glow-sleeping-mask-2.jpeg'),
(14, 'Peptide Glazing Fluid', 'Rhode', 'Serum', 'All Skin Types', ' Hydration, Plumping, Fine Lines', 'Niacinamide,\r\nPeptides,\r\nHyaluronic Acid', ' Apply a few drops to clean, dry skin before moisturizer, morning and night', 29.00, 50, 'https://wear-next.com/wp-content/uploads/2022/07/Peptide-glazing-fluid_1_2480x-edited.jpeg'),
(15, 'Barrier Restore Cream', 'Rhode', 'Moisturizer', 'All, especially sensitive', 'Barrier Repair, Redness, Dryness', 'Squalane,\r\nShea Butter,\r\nCeramides', 'Apply to face and neck as the last step in your skincare routine, morning and night.', 35.00, 50, 'https://th.bing.com/th/id/OIP.BpvWmE-T7f11sr05uwZfVwHaFj?rs=1&pid=ImgDetMain'),
(16, 'Watermelon Glow Niacinamide Dew Drops', 'Glow Recipe', 'Serum', 'All', 'Dullness, Pores, Uneven Texture', 'Watermelon Extract,\r\nNiacinamide,\r\nHyaluronic Acid', 'Apply 1-2 pumps to clean skin before moisturizer for a dewy glow.\r\n', 34.00, 40, 'https://i.pinimg.com/originals/18/b7/c1/18b7c1e6b153e9d3a69bd672209b3e79.jpg'),
(17, 'Pineapple-C Bright Serum', 'Glow Recipe', 'All', 'All', 'Dullness, Dark Spots, Uneven Tone', 'Pineapple Extract,\r\nVitamin C,\r\nHyaluronic Acid', 'Apply 2-3 drops on clean skin in the morning and follow with sunscreen.', 34.00, 30, 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/glow-recipe-pineapple-c-bright-serum-review-1554288096.jpg?crop=0.836xw:0.836xh;0.0719xw,0&resize=480:*'),
(20, 'Blueberry Bounce Gentle Cleanser', 'Glow Recipe', 'Cleanser', 'All skin types', 'Cleansing, Hydration', 'Blueberry Extract, Hyaluronic Acid, AHA (Alpha Hydroxy Acid)', 'Massage onto wet skin, rinse thoroughly with warm water.', 34.00, 160, 'https://sunkissedblush.blog/wp-content/uploads/2018/10/sunkissedblush-glow-recipe-blueberry-bounce-gentle-cleanser-3-of-9.jpg'),
(21, 'Banana Soufflé Moisture Cream', 'Glow Recipe', 'Moisturizer', ' Normal, Dry, Combination', ' Hydration, Soothing', 'Banana Extract, Centella Asiatica, Magnesium PCA', 'Apply a dime-sized amount to clean skin morning and night. Can be used as a moisturizer or a soothing mask.', 39.00, 50, 'https://i.pinimg.com/originals/a1/1b/af/a11baf11535c0b4c31cb3a3a1b597f20.jpg'),
(22, 'Watermelon Glow Pink Juice Moisturizer', 'Glow Recipe', 'Moisturizer', 'All Skin Types', 'Hydration, Radiance', 'Watermelon Extract, Hyaluronic Acid, Antioxidants', 'Apply evenly to clean skin morning and night. Can be used under makeup.', 39.00, 75, 'https://www.wondersmy.com/wp-content/uploads/2019/07/p428819-av-02-zoom.jpg'),
(23, 'Sunday Riley CEO Glow Vitamin C + Turmeric Face Oil', 'Sunday Riley', 'Face oil', 'All Skin Types', 'Brightening, Anti-aging', ' Vitamin C, Turmeric Oil, Evening Primrose Oil', 'Massage two to three drops into clean, dry skin morning and night.', 80.00, 35, 'https://cdn.shopify.com/s/files/1/1681/2995/products/FINAL_US_ceo_glow_turmeric_005_2000x2000_150dpi.jpg?v=1655486771&width=1680');

-- --------------------------------------------------------

--
-- Table structure for table `skincare_routines`
--

CREATE TABLE `skincare_routines` (
  `routine_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `products` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skincare_routines`
--

INSERT INTO `skincare_routines` (`routine_id`, `name`, `description`, `products`, `created_at`) VALUES
(1, 'Seah  Wee Ling', 'good description of the', '2,3', '2024-07-15 21:45:09'),
(2, 'sdf', 'asdf', '2,3', '2024-07-15 21:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `skin_type` varchar(50) NOT NULL,
  `concerns` varchar(255) NOT NULL,
  `objectives` varchar(255) NOT NULL,
  `allergies` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `skin_type`, `concerns`, `objectives`, `allergies`, `password`) VALUES
(11, 'Trinhhh', '23008805@myrp.edu.sg', 'Normal', 'Skin Dryness', 'Skin Hydration', 'Vitamin C', '123Password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress_entries`
--
ALTER TABLE `progress_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `skincare_db`
--
ALTER TABLE `skincare_db`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `skincare_routines`
--
ALTER TABLE `skincare_routines`
  ADD PRIMARY KEY (`routine_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `progress_entries`
--
ALTER TABLE `progress_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `skincare_db`
--
ALTER TABLE `skincare_db`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `skincare_routines`
--
ALTER TABLE `skincare_routines`
  MODIFY `routine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
