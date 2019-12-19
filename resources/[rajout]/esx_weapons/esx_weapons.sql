-- Items weapons
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('GADGET_PARACHUTE',        'Parachute', 3),
  ('WEAPON_PETROLCAN',        "Bidon d'Essence", 5),
  ('WEAPON_FIREEXTINGUISHER', 'Extincteur', 6),
  ('WEAPON_MOLOTOV',          '[arme] Coktail Molotov', 6),
  ('WEAPON_BZGAS',            '[arme] Grenade à gaz BZ', 6),
  ('WEAPON_FLASHLIGHT',       '[arme] Lampe de poche', 6),
  ('WEAPON_KNIFE',            '[arme] Couteau', 8),
  ('WEAPON_HAMMER',           '[arme] Marteau', 8),
  ('WEAPON_CROWBAR',          '[arme] Pied-de-biche', 6),
  ('WEAPON_BAT',              '[arme] Batte de Baseball', 6),
  ('WEAPON_POOLCUE',          '[arme] Queue de billard', 6),
  ('WEAPON_GOLFCLUB',         '[arme] Club de golf', 6),
  ('WEAPON_HATCHET',          '[arme] Hachette', 6),
  ('WEAPON_MACHETE',          '[arme] Machette', 6),
  ('WEAPON_KNUCKLE',          '[arme] Poing américain', 8),
  ('WEAPON_SWITCHBLADE',      "[arme] Couteau à cran d'arrêt", 8),
  ('WEAPON_NIGHTSTICK',       '[arme] Matraque', 6),
  ('WEAPON_FLAREGUN',         '[arme] Pistolet de détresse', 6),
  ('WEAPON_STUNGUN',          '[arme] Tazer', 6),
  ('WEAPON_SNSPISTOL',        '[arme] Pétoire', 6),
  ('WEAPON_COMBATPISTOL',     '[arme] Pistolet de combat', 6),
  ('WEAPON_REVOLVER',         '[arme] Revolver lourd', 6),
  ('WEAPON_HEAVYPISTOL',      '[arme] Pistolet lourd', 6),
  ('WEAPON_PISTOL_MK2',       '[arme] Pistolet Mk II', 6),
  ('WEAPON_MUSKET',           '[arme] Mousquet', 4),
  ('WEAPON_DBSHOTGUN',        '[arme] Fusil à double canon', 4),
  ('WEAPON_SAWNOFFSHOTGUN',   '[arme] Fusil à canon scié', 4),
  ('WEAPON_SMG',              '[arme] Mitraillette', 4),
  ('WEAPON_SMG_MK2',          '[arme] SMG Mk II', 4),
  ('WEAPON_BULLPUPSHOTGUN',   '[arme] Fusil à pompe Bullpup', 4),
  ('WEAPON_ASSAULTSMG',       "[arme] SMG d'assaut", 4),
  ('WEAPON_MARKSMANRIFLE',    '[arme] Fusil à lunette', 3),
  ('WEAPON_ASSAULTRIFLE',     "[arme] Fusil d'assaut", 3)
;

-- Items skins
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('COMPONENT_KNUCKLE_VARMOD_PLAYER',         '[skin] Poing américain - Joueur', 5),
  ('COMPONENT_KNUCKLE_VARMOD_LOVE',           '[skin] Poing américain - Amour', 5),
  ('COMPONENT_KNUCKLE_VARMOD_DOLLAR',         '[skin] Poing américain - Dollar', 5),
  ('COMPONENT_KNUCKLE_VARMOD_VAGOS',          '[skin] Poing américain - Vagos', 5),
  ('COMPONENT_KNUCKLE_VARMOD_HATE',           '[skin] Poing américain - Haine', 5),
  ('COMPONENT_KNUCKLE_VARMOD_DIAMOND',        '[skin] Poing américain - Diamant', 5),
  ('COMPONENT_KNUCKLE_VARMOD_PIMP',           '[skin] Poing américain - Pimp', 5),
  ('COMPONENT_KNUCKLE_VARMOD_KING',           '[skin] Poing américain - King', 5),
  ('COMPONENT_KNUCKLE_VARMOD_BALLAS',         '[skin] Poing américain - Ballas', 5),
  ('COMPONENT_SWITCHBLADE_VARMOD_VAR1',       "[skin] Couteau à cran d'arrêt - VIP", 5),
  ('COMPONENT_SWITCHBLADE_VARMOD_VAR2',       "[skin] Couteau à cran d'arrêt - Bois", 5),
  ('COMPONENT_REVOLVER_VARMOD_BOSS',          '[skin] Revolver - Boss', 5),
  ('COMPONENT_REVOLVER_VARMOD_GOON',          '[skin] Revolver - Voyou', 5),
  ('COMPONENT_MK2_CAMO',                      '[skin] Camouflage Mk II - Pixel', 5),
  ('COMPONENT_MK2_CAMO_02',                   '[skin] Camouflage Mk II - Pinceau', 5),
  ('COMPONENT_MK2_CAMO_03',                   '[skin] Camouflage Mk II - Forestier', 5),
  ('COMPONENT_MK2_CAMO_04',                   '[skin] Camouflage Mk II - Crânien', 5),
  ('COMPONENT_MK2_CAMO_05',                   '[skin] Camouflage Mk II - Sessanta Nove', 5),
  ('COMPONENT_MK2_CAMO_06',                   '[skin] Camouflage Mk II - Perseus', 5),
  ('COMPONENT_MK2_CAMO_07',                   '[skin] Camouflage Mk II - Léopard', 5),
  ('COMPONENT_MK2_CAMO_08',                   '[skin] Camouflage Mk II - Zébré', 5),
  ('COMPONENT_MK2_CAMO_09',                   '[skin] Camouflage Mk II - Géométrique', 5),
  ('COMPONENT_MK2_CAMO_10',                   '[skin] Camouflage Mk II - Détonant', 5),
  ('COMPONENT_MK2_CAMO_IND_01',               '[skin] Camouflage Mk II - Patriote', 5),
  ('COMPONENT_VARMOD_LOWRIDER',               '[skin] Finition - Lowrider', 5),
  ('COMPONENT_VARMOD_LUXE',                   '[skin] Finition - Luxe', 5)
;

-- Items components
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('COMPONENT_AT_PI_SUPP',                    '[acc] Silencieux (Pistolets)', 5),
  ('COMPONENT_AT_AR_SUPP_02',                 '[acc] Silencieux (Fusils)', 5),
  ('COMPONENT_AT_PI_FLSH',                    '[acc] Lampe torche (Pistolets)', 5),
  ('COMPONENT_AT_AR_FLSH',                    '[acc] Lampe torche (Fusils)', 5),
  ('COMPONENT_AT_AR_AFGRIP',                  '[acc] Poignée (Fusils)', 5),
  ('COMPONENT_AT_SCOPE_MACRO',                '[acc] Lunette (Fusils)', 5),
  ('COMPONENT_AT_PI_CLIP_02',                 '[acc] Magasin étendu (Pistolets)', 5),
  ('COMPONENT_AT_AR_CLIP_02',                 '[acc] Magasin étendu (Fusils)', 5),
  ('COMPONENT_AT_AR_CLIP_03',                 '[acc] Magasin très étendu (Fusils)', 5),
  ('COMPONENT_AT_PI_COMP',                    '[acc] Compensateur (Pistolet Mk II)', 5),
  ('COMPONENT_AT_PI_RAIL',                    '[acc] Viseur holographique (Pistolet Mk II)', 5),
  ('COMPONENT_AT_SIGHTS_SMG',                 '[acc] Viseur holographique (SMG Mk II)', 5),
  ('COMPONENT_AT_MUZZLE_03',                  '[acc] Compensateur (SMG Mk II)', 5),
  ('COMPONENT_AT_SB_BARREL_02',               '[acc] Canon lourd (SMG Mk II)', 5)
;

-- Items component tints
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('COMPONENT_TINT_01',     '[skin2] Gris foncé (Mk II)', 5),
  ('COMPONENT_TINT_02',     '[skin2] Noir (Mk II)', 5),
  ('COMPONENT_TINT_03',     '[skin2] Blanc (Mk II)', 5),
  ('COMPONENT_TINT_04',     '[skin2] Bleu (Mk II)', 5),
  ('COMPONENT_TINT_05',     '[skin2] Cyan (Mk II)', 5),
  ('COMPONENT_TINT_06',     '[skin2] Aigue-marine (Mk II)', 5),
  ('COMPONENT_TINT_07',     '[skin2] Bleu polaire (Mk II)', 5),
  ('COMPONENT_TINT_08',     '[skin2] Bleu foncé (Mk II)', 5),
  ('COMPONENT_TINT_09',     '[skin2] Bleu royal (Mk II)', 5),
  ('COMPONENT_TINT_10',     '[skin2] Prune (Mk II)', 5),
  ('COMPONENT_TINT_11',     '[skin2] Violet foncé (Mk II)', 5),
  ('COMPONENT_TINT_12',     '[skin2] Violet (Mk II)', 5),
  ('COMPONENT_TINT_13',     '[skin2] Rouge (Mk II)', 5),
  ('COMPONENT_TINT_14',     '[skin2] Rouge sang (Mk II)', 5),
  ('COMPONENT_TINT_15',     '[skin2] Magenta (Mk II)', 5),
  ('COMPONENT_TINT_16',     '[skin2] Rose (Mk II)', 5),
  ('COMPONENT_TINT_17',     '[skin2] Saumon (Mk II)', 5),
  ('COMPONENT_TINT_18',     '[skin2] Rose vif (Mk II)', 5),
  ('COMPONENT_TINT_19',     '[skin2] Orange rouille (Mk II)', 5),
  ('COMPONENT_TINT_20',     '[skin2] Marron (Mk II)', 5),
  ('COMPONENT_TINT_21',     "[skin2] Terre d'ombre (Mk II)", 5),
  ('COMPONENT_TINT_22',     '[skin2] Orange (Mk II)', 5),
  ('COMPONENT_TINT_23',     '[skin2] Orange clair (Mk II)', 5),
  ('COMPONENT_TINT_24',     '[skin2] Jaune foncé (Mk II)', 5),
  ('COMPONENT_TINT_25',     '[skin2] Jaune (Mk II)', 5),
  ('COMPONENT_TINT_26',     '[skin2] Marron clair (Mk II)', 5),
  ('COMPONENT_TINT_27',     '[skin2] Vert lime (Mk II)', 5),
  ('COMPONENT_TINT_28',     '[skin2] Vert oline (Mk II)', 5),
  ('COMPONENT_TINT_29',     '[skin2] Vert mousse (Mk II)', 5),
  ('COMPONENT_TINT_30',     '[skin2] Turquoise (Mk II)', 5),
  ('COMPONENT_TINT_31',     '[skin2] Vert foncé (Mk II)', 5)
;

-- Items tints
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('TINT_01',              '[tint] Vert', 5),
  ('TINT_02',              '[tint] Or', 5),
  ('TINT_03',              '[tint] Rose', 5),
  ('TINT_04',              '[tint] Militaire', 5),
  ('TINT_05',              '[tint] LSPD', 5),
  ('TINT_06',              '[tint] Orange', 5),
  ('TINT_07',              '[tint] Platine', 5),
  ('TINT_MK2_01',          '[tint] Gris classique (Mk II)', 5),
  ('TINT_MK2_02',          '[tint] Bicolore classique (Mk II)', 5),
  ('TINT_MK2_03',          '[tint] Blanc classique (Mk II)', 5),
  ('TINT_MK2_04',          '[tint] Beige classique (Mk II)', 5),
  ('TINT_MK2_05',          '[tint] Vert classique (Mk II)', 5),
  ('TINT_MK2_06',          '[tint] Bleu classique (Mk II)', 5),
  ('TINT_MK2_07',          '[tint] Marron classique (Mk II)', 5),
  ('TINT_MK2_08',          '[tint] Brun-noir classique (Mk II)', 5),
  ('TINT_MK2_09',          '[tint] Constraste rouge (Mk II)', 5),
  ('TINT_MK2_10',          '[tint] Contraste bleu (Mk II)', 5),
  ('TINT_MK2_11',          '[tint] Contraste jaune (Mk II)', 5),
  ('TINT_MK2_12',          '[tint] Contraste orange (Mk II)', 5),
  ('TINT_MK2_13',          '[tint] Rose vif (Mk II)', 5),
  ('TINT_MK2_14',          '[tint] Violet-jaune vif (Mk II)', 5),
  ('TINT_MK2_15',          '[tint] Orange vif (Mk II)', 5),
  ('TINT_MK2_16',          '[tint] Vert-violet vif (Mk II)', 5),
  ('TINT_MK2_17',          '[tint] Détails rouge vif (Mk II)', 5),
  ('TINT_MK2_18',          '[tint] Détails vert vif (Mk II)', 5),
  ('TINT_MK2_19',          '[tint] Détails cyan vif (Mk II)', 5),
  ('TINT_MK2_20',          '[tint] Détails jaune vif (Mk II)', 5),
  ('TINT_MK2_21',          "[tint] Rouge-blanc vif", 5),
  ('TINT_MK2_22',          '[tint] Bleu-blanc vif (Mk II)', 5),
  ('TINT_MK2_23',          '[tint] Or métallisé (Mk II)', 5),
  ('TINT_MK2_24',          '[tint] Platine métallisé (Mk II)', 5),
  ('TINT_MK2_25',          '[tint] Gris-lilas métallisé (Mk II)', 5),
  ('TINT_MK2_26',          '[tint] Violet-vert métallisé (Mk II)', 5),
  ('TINT_MK2_27',          '[tint] Rouge métallisé (Mk II)', 5),
  ('TINT_MK2_28',          '[tint] Vert métallisé (Mk II)', 5),
  ('TINT_MK2_29',          '[tint] Bleu métallisé (Mk II)', 5),
  ('TINT_MK2_30',          '[tint] Blanc-turquoise métallisé (Mk II)', 5),
  ('TINT_MK2_31',          '[tint] Rouge-jaune métallisé  (Mk II)', 5)
;