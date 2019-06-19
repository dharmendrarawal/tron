<#
Purpose:       Script to remove many of the pre-loaded 3rd-party Metro "modern app" bloatware. Called by Tron in Stage 2: De-bloat
               Add any AppX uninstall commands to this list to target them for removal
Requirements:  1. Administrator access
               2. Windows 8 and up
Author:        vocatus on reddit.com/r/TronScript ( vocatus.gate at gmail ) // PGP key: 0x07d1490f82a211a2
Version:       1.4.0 + Add additional user-submitted entries
#>
$ErrorActionPreference = "SilentlyContinue"


########
# PREP #
########
$METRO_3RD_PARTY_MODERN_APPS_TO_TARGET_BY_NAME_SCRIPT_VERSION = "1.4.0"
$METRO_3RD_PARTY_MODERN_APPS_TO_TARGET_BY_NAME_SCRIPT_DATE = "2019-06-19"


# Needed for Removal
$AppxPackages = Get-AppxProvisionedPackage -online | select-object PackageName,Displayname
$ProPackageList = Get-AppxPackage -AllUsers | select-object PackageFullName, Name
$Script:AppxCount3rd = 0

# App Removal function
Function Remove-App([String]$AppName){
	If($AppxPackages.DisplayName -match $AppName -or $ProPackageList.Name -match $AppName ) {
		$PackageFullName = ($ProPackageList | where {$_.Name -like $AppName}).PackageFullName
		$ProPackageFullName = ($AppxPackages | where {$_.Displayname -like $AppName}).PackageName

		If($PackageFullName -is [array]){
			For($i=0 ;$i -lt $PackageFullName.Length ;$i++) {
				$Script:AppxCount3rd++
				$Job = "TronScript3rd$AppxCount3rd"
				$PackageF = $PackageFullName[$i]
				$ProPackage = $ProPackageFullName[$i]
				write-output "$AppxCount3rd - $PackageF"
				Start-Job -Name $Job -ScriptBlock {
					Remove-AppxPackage -Package $using:PackageF | Out-null
					Remove-AppxProvisionedPackage -Online -PackageName $using:ProPackage | Out-null
				} | Out-null
			}
		} Else {
			$Script:AppxCount3rd++
			$Job = "TronScript3rd$AppxCount3rd"
			write-output "$AppxCount3rd - $PackageFullName"
			Start-Job -Name $Job -ScriptBlock {
				Remove-AppxPackage -Package $using:PackageFullName | Out-null
				Remove-AppxProvisionedPackage -Online -PackageName $using:ProPackageFullName | Out-null
			} | Out-null
		}
	}
}


###########
# EXECUTE #
###########
# Active identifiers
Remove-App "*DragonManiaLegends"
Remove-App "*HiddenCityMysteryofShadows"
Remove-App "*MarchofEmpires"
Remove-App "*toolbar*"
Remove-App "06DAC6F6.StumbleUpon"
Remove-App "09B6C2D8.TheTreasuresofMontezuma3"
Remove-App "10084FinerCode.ChessTactics"
Remove-App "11610RobertVarga.StopwatchFree"
Remove-App "134D4F5B.Box*"
Remove-App "1430GreenfieldTechnologie.PuzzleTouch*"
Remove-App "184MagikHub.TextizeMindMap"
Remove-App "1867LennardSprong.PortablePuzzleCollection"
Remove-App "21090PaddyXu.QuickLook"
Remove-App "2164RexileStudios.FastYoutubeDownloader"
Remove-App "22062EdgeWaySoftware.TheLogosQuiz"
Remove-App "22094SynapticsIncorporate.AudioControls"
Remove-App "22450.BestVideoConverter"
Remove-App "24712m1dfmmengesha.TestFrameworkBP052015"
Remove-App "24712m1dfmmengesha.TestFrameworkBackpublish050515"
Remove-App "24712m1dfmmengesha.TestFrameworkwin81appxneutral06"
Remove-App "24712m1dfmmengesha.mxtest2"
Remove-App "25920Bala04.Mideo-VideoPlayer"
Remove-App "26704KathyGrobbelaar.GPSRoutes"
Remove-App "26720RandomSaladGamesLLC.HeartsDeluxe*"
Remove-App "26720RandomSaladGamesLLC.Hexter"
Remove-App "26720RandomSaladGamesLLC.SimpleMahjong"
Remove-App "26720RandomSaladGamesLLC.SimpleSolitaire*"
Remove-App "26720RandomSaladGamesLLC.Spades"
Remove-App "2703103D.McAfeeCentral"
Remove-App "27345RickyWalker.BlackjackMaster3"
Remove-App "29313JVGoldSoft.5962504421940"
Remove-App "29534ukaszKurant.Logicos"
Remove-App "29534ukaszKurant.Logicos2"
Remove-App "29982CsabaHarmath.UnCompress*"
Remove-App "2FE3CB00.PICSART-PHOTOSTUDIO"
Remove-App "2FE3CB00.PicsArt-PhotoStudio*"
Remove-App "32988BernardoZamora.SolitaireHD"
Remove-App "34697joal.EasyMovieMaker"
Remove-App "35229MihaiM.QuizforGeeks"
Remove-App "35300Kubajzl.MCGuide"
Remove-App "37162EcsolvoTechnologies.UltraStopwatchTimer"
Remove-App "37442SublimeCo.AlarmClockForYou"
Remove-App "37457BenoitRenaud.HexWar"
Remove-App "39674HytoGame.TexasHoldemOnline"
Remove-App "39806kalinnikol.FreeCellSolitaireHD"
Remove-App "39806kalinnikol.FreeHeartsHD"
Remove-App "40459File-New-Project.EarTrumpet"
Remove-App "40538vasetest101.TESTFRAMEWORKABO2"
Remove-App "41038AXILESOFT.ACGMEDIAPLAYER"
Remove-App "41879VbfnetApps.FileDownloader"
Remove-App "42569AlexisPayendelaGaran.OtakuAssistant"
Remove-App "44218hungrymousegames.Mou"
Remove-App "45604EntertainmentandMusi.Open7-Zip"
Remove-App "46928bounde.EclipseManager*"
Remove-App "47404LurkingDarknessOfRoy.SimpleStrategyRTS"
Remove-App "48682KiddoTest.Frameworkuapbase"
Remove-App "4AE8B7C2.Booking.comPartnerEdition*"
Remove-App "50856m1dfLL.TestFrameworkProd06221501"
Remove-App "51248Raximus.Dobryplan"
Remove-App "5269FriedChicken.YouTubeVideosDownloader*"
Remove-App "55407EducationLife.LearntoMicrosoftAccess2010forBe"
Remove-App "56081SweetGamesBox.SlitherSnake.io"
Remove-App "56491SimulationFarmGames.100BallsOriginal"
Remove-App "57591LegendsSonicSagaGame.Twenty48Solitaire"
Remove-App "57868Codaapp.UploadforInstagram"
Remove-App "58033franckdakam.4KHDFreeWallpapers"
Remove-App "59091GameDesignStudio.MahjongDe*"
Remove-App "59169Willpowersystems.BlueSkyBrowser"
Remove-App "5A894077.McAfeeSecurity"
Remove-App "64885BlueEdge.OneCalendar*"
Remove-App "65327Damicolo.BartSimpsonSkateMania"
Remove-App "6Wunderkinder.Wunderlist"
Remove-App "7475BEDA.BitcoinMiner"
Remove-App "780F5C7B.FarmUp"
Remove-App "7906AAC0.TOSHIBACanadaPartners*"
Remove-App "7906AAC0.ToshibaCanadaWarrantyService*"
Remove-App "7EE7776C.LinkedInforWindows"
Remove-App "7digitalLtd.7digitalMusicStore*"
Remove-App "828B5831.HiddenCityMysteryofShadows"
Remove-App "89006A2E.AutodeskSketchBook*"
Remove-App "8tracksradio.8tracksradio"
Remove-App "95FE1D22.VUDUMoviesandTV"
Remove-App "9E2F88E3.Twitter"
Remove-App "9FD20106.MediaPlayerQueen"
Remove-App "A278AB0D.DisneyMagicKingdoms"
Remove-App "A278AB0D.DragonManiaLegends*"
Remove-App "A278AB0D.GameloftGames"
Remove-App "A278AB0D.MarchofEmpires"
Remove-App "A278AB0D.PaddingtonRun"
Remove-App "A34E4AAB.YogaChef*"
Remove-App "A8C75DD4.Therefore"
Remove-App "A97ECD55.KYOCERAPrintCenter"
Remove-App "AD2F1837.DiscoverHPTouchpointManager"
Remove-App "AD2F1837.GettingStartedwithWindows8"
Remove-App "AD2F1837.HPBusinessSlimKeyboard"
Remove-App "AD2F1837.HPConnectedMusic"
Remove-App "AD2F1837.HPConnectedPhotopoweredbySnapfish"
Remove-App "AD2F1837.HPFileViewer"
Remove-App "AD2F1837.HPGames"
Remove-App "AD2F1837.HPInc.EnergyStar"
Remove-App "AD2F1837.HPJumpStart"
Remove-App "AD2F1837.HPPCHardwareDiagnosticsWindows"
Remove-App "AD2F1837.HPPhoneWise"
Remove-App "AD2F1837.HPPowerManager"
Remove-App "AD2F1837.HPPrimeFree"
Remove-App "AD2F1837.HPRegistration"
Remove-App "AD2F1837.HPSupportAssistant"
Remove-App "AD2F1837.HPSystemEventUtility"
Remove-App "AD2F1837.HPWelcome"
Remove-App "AD2F1837.SmartfriendbyHPCare"
Remove-App "ASUSCloudCorporation.MobileFileExplorer"
Remove-App "AccuWeather.AccuWeatherforWindows8*"
Remove-App "AcerIncorporated*"
Remove-App "AcerIncorporated.AcerCareCenter"
Remove-App "AcerIncorporated.AcerCollection"
Remove-App "AcerIncorporated.AcerCollectionS"
Remove-App "AcerIncorporated.AcerExplorer"
Remove-App "AcerIncorporated.AcerRegistration"
Remove-App "AcerIncorporated.PredatorSenseV31"
Remove-App "AcerIncorporated.QuickAccess"
Remove-App "AcerIncorporated.UserExperienceImprovementProgram"
Remove-App "AcrobatNotificationClient"
Remove-App "ActiproSoftwareLLC*"
Remove-App "ActiproSoftwareLLC.562882FEEB491"
Remove-App "Adictiz.SpaceDogRun"
Remove-App "AdobeSystemsIncorporated.AdobePhotoshopExpress*"
Remove-App "AdobeSystemsIncorporated.AdobeRevel*"
Remove-App "Amazon.com.Amazon*"
Remove-App "AppUp.IntelAppUpCatalogueAppWorldwideEdition*"
Remove-App "B9ECED6F.ASUSBatteryHealthCharging"
Remove-App "B9ECED6F.ASUSFiveinARow"
Remove-App "B9ECED6F.ASUSGIFTBOX*"
Remove-App "B9ECED6F.ASUSProductRegistrationProgram"
Remove-App "B9ECED6F.ASUSTutor"
Remove-App "B9ECED6F.ASUSTutorial"
Remove-App "B9ECED6F.ASUSWelcome"
Remove-App "B9ECED6F.MyASUS"
Remove-App "B9ECED6F.TheWorldClock"
Remove-App "B9ECED6F.eManual"
Remove-App "BD9B8345.AlbumbySony*"
Remove-App "BD9B8345.MusicbySony*"
Remove-App "BD9B8345.Socialife*"
Remove-App "BD9B8345.VAIOCare*"
Remove-App "BD9B8345.VAIOMessageCenter*"
Remove-App "C27EB4BA.DropboxOEM"
Remove-App "COMPALELECTRONICSINC.AlienwareOSDKits"
Remove-App "COMPALELECTRONICSINC.AlienwareTypeCaccessory"
Remove-App "COMPALELECTRONICSINC.Alienwaredockingaccessory"
Remove-App "ChaChaSearch.ChaChaPushNotification*"
Remove-App "ClearChannelRadioDigital.iHeartRadio*"
Remove-App "CrackleInc.Crackle*"
Remove-App "CyberLinkCorp.ac.AcerCrystalEye*"
Remove-App "CyberLinkCorp.ac.PhotoDirectorforacerDesktop"
Remove-App "CyberLinkCorp.ac.PowerDirectorforacerDesktop"
Remove-App "CyberLinkCorp.ac.SocialJogger*"
Remove-App "CyberLinkCorp.hs.PowerMediaPlayer14forHPConsumerPC"
Remove-App "CyberLinkCorp.hs.YouCamforHP*"
Remove-App "CyberLinkCorp.id.PowerDVDforLenovoIdea*"
Remove-App "CyberLinkCorp.ss.SCamera"
Remove-App "CyberLinkCorp.ss.SGallery"
Remove-App "CyberLinkCorp.ss.SPlayer"
Remove-App "D52A8D61.FarmVille2CountryEscape*"
Remove-App "D5EA27B7.Duolingo-LearnLanguagesforFree*"
Remove-App "DB6EA5DB.CyberLinkMediaSuiteEssentials*"
Remove-App "DB6EA5DB.MediaSuiteEssentialsforDell"
Remove-App "DB6EA5DB.Power2GoforDell"
Remove-App "DB6EA5DB.PowerDirectorforDell"
Remove-App "DailymotionSA.Dailymotion*"
Remove-App "DellInc.AlienwareCommandCenter"
Remove-App "DellInc.AlienwareCustomerConnect"
Remove-App "DellInc.AlienwareProductRegistration"
Remove-App "DellInc.DellCommandUpdate"
Remove-App "DellInc.DellCustomerConnect"
Remove-App "DellInc.DellDigitalDelivery"
Remove-App "DellInc.DellGettingStartedwithWindows8"
Remove-App "DellInc.DellHelpSupport"
Remove-App "DellInc.DellPowerManager"
Remove-App "DellInc.DellProductRegistration"
Remove-App "DellInc.DellShop"
Remove-App "DellInc.DellSupportAssistforPCs"
Remove-App "DeviceDoctor.RAROpener"
Remove-App "DolbyLaboratories.DolbyAccess*"
Remove-App "DolbyLaboratories.DolbyAtmosSoundSystem"
Remove-App "DolbyLaboratories.DolbyAtmosforGaming"
Remove-App "Drawboard.DrawboardPDF*"
Remove-App "DriverToaster*"
Remove-App "E046963F.LenovoCompanion*"
Remove-App "E046963F.LenovoSupport*"
Remove-App "E0469640.CameraMan*"
Remove-App "E0469640.DeviceCollaboration*"
Remove-App "E0469640.LenovoRecommends*"
Remove-App "E0469640.YogaCameraMan*"
Remove-App "E0469640.YogaPhoneCompanion*"
Remove-App "E0469640.YogaPicks*"
Remove-App "E97CB0A1.LogitechCameraController"
Remove-App "ESPNInc.WatchESPN*"
Remove-App "Ebates.EbatesCashBack"
Remove-App "EncyclopaediaBritannica.EncyclopaediaBritannica*"
Remove-App "Evernote.Evernote"
Remove-App "Evernote.Skitch*"
Remove-App "EvilGrogGamesGmbH.WorldPeaceGeneral2017"
Remove-App "F5080380.ASUSPowerDirector*"
Remove-App "Facebook.317180B0BB486"
Remove-App "Facebook.Facebook"
Remove-App "Facebook.InstagramBeta*"
Remove-App "FilmOnLiveTVFree.FilmOnLiveTVFree*"
Remove-App "Fingersoft.HillClimbRacing"
Remove-App "FingertappsInstruments*"
Remove-App "FingertappsOrganizer*"
Remove-App "Flipboard.Flipboard*"
Remove-App "FreshPaint*"
Remove-App "GAMELOFTSA.Asphalt8Airborne*"
Remove-App "GAMELOFTSA.DespicableMeMinionRush"
Remove-App "GAMELOFTSA.SharkDash*"
Remove-App "GameGeneticsApps.FreeOnlineGamesforLenovo*"
Remove-App "GettingStartedwithWindows8*"
Remove-App "GoogleInc.GoogleSearch"
Remove-App "HPConnectedMusic*"
Remove-App "HPConnectedPhotopoweredbySnapfish*"
Remove-App "HPRegistration*"
Remove-App "HuluLLC.HuluPlus*"
Remove-App "InsightAssessment.CriticalThinkingInsight"
Remove-App "JigsWar*"
Remove-App "K-NFBReadingTechnologiesI.BookPlace*"
Remove-App "KasperskyLab.KasperskyNow*"
Remove-App "KeeperSecurityInc.Keeper"
Remove-App "KindleforWindows8*"
Remove-App "LenovoCorporation.LenovoID*"
Remove-App "LenovoCorporation.LenovoSettings*"
Remove-App "MAGIX.MusicMakerJam*"
Remove-App "McAfeeInc.01.McAfeeSecurityAdvisorforDell"
Remove-App "McAfeeInc.05.McAfeeSecurityAdvisorforASUS"
Remove-App "Mobigame.ZombieTsunami"
Remove-App "MobileFileExplorer*"
Remove-App "MobilesRepublic.NewsRepublic"
Remove-App "MobirateLtd.ParkingMania"
Remove-App "MusicMakerJam*"
Remove-App "NAMCOBANDAIGamesInc.PAC-MANChampionshipEditionDXfo*"
Remove-App "NAVER.LINEwin8*"
Remove-App "NBCUniversalMediaLLC.NBCSportsLiveExtra*"
Remove-App "NORDCURRENT.COOKINGFEVER"
Remove-App "NevosoftLLC.MushroomAge"
Remove-App "Nordcurrent.CookingFever"
Remove-App "OCS.OCS"
Remove-App "Ookla.SpeedtestbyOokla"
Remove-App "OrangeFrance.MaLivebox"
Remove-App "OrangeFrance.MailOrange"
Remove-App "OrangeFrance.TVdOrange"
Remove-App "PandoraMediaInc.29680B314EFC2"
Remove-App "PinballFx2*"
Remove-App "Playtika.CaesarsSlotsFreeCasino*"
Remove-App "Priceline"
Remove-App "PricelinePartnerNetwork.Priceline.comTheBestDealso"
Remove-App "PublicationsInternational.iCookbookSE*"
Remove-App "RandomSaladGamesLLC.GinRummyProforHP*"
Remove-App "RealtekSemiconductorCorp.RealtekAudioControl"
Remove-App "Relay.com.KiosqueRelay"
Remove-App "SAMSUNGELECTRONICSCO.LTD.OnlineSupportSService"
Remove-App "SAMSUNGELECTRONICSCO.LTD.PCGallery"
Remove-App "SAMSUNGELECTRONICSCO.LTD.PCMessage"
Remove-App "SAMSUNGELECTRONICSCO.LTD.SamsungPCCleaner"
Remove-App "SAMSUNGELECTRONICSCO.LTD.SamsungPrinterExperience"
Remove-App "SAMSUNGELECTRONICSCO.LTD.Wi-FiTransfer"
Remove-App "ScreenovateTechnologies.DellMobileConnect"
Remove-App "ShazamEntertainmentLtd.Shazam*"
Remove-App "SocialQuantumIreland.WildWestNewFrontier"
Remove-App "SolidRhino.SteelTactics"
Remove-App "SonicWALL.MobileConnect"
Remove-App "SpotifyAB.SpotifyMusic"
Remove-App "SprakelsoftUG.CrocsWorld"
Remove-App "SprakelsoftUG.FlapFlapFlap"
Remove-App "SymantecCorporation.NortonStudio*"
Remove-App "SynapticsIncorporated.SynHPConsumerDApp"
Remove-App "TOSHIBATEC.ToshibaPrintExperience"
Remove-App "TelegraphMediaGroupLtd.TheTelegraphforLenovo*"
Remove-App "TheNewYorkTimes.NYTCrossword*"
Remove-App "ThumbmunkeysLtd.PhototasticCollage"
Remove-App "ThumbmunkeysLtd.PhototasticCollage*"
Remove-App "ToshibaAmericaInformation.ToshibaCentral*"
Remove-App "TripAdvisorLLC.TripAdvisorHotelsFlightsRestaurants*"
Remove-App "TuneIn.TuneInRadio*"
Remove-App "UniversalMusicMobile.HPLOUNGE"
Remove-App "UptoElevenDigitalSolution.mysms-Textanywhere*"
Remove-App "Vimeo.Vimeo*"
Remove-App "Weather.TheWeatherChannelforHP*"
Remove-App "Weather.TheWeatherChannelforLenovo*"
Remove-App "WeatherBug.a.WeatherBug"
Remove-App "WhatsNew"
Remove-App "WildTangentGames*"
Remove-App "WildTangentGames.-GamesApp-"
Remove-App "WildTangentGames.63435CFB65F55"
Remove-App "WinZipComputing.WinZipUniversal*"
Remove-App "XINGAG.XING"
Remove-App "XeroxCorp.PrintExperience"
Remove-App "YouSendIt.HighTailForLenovo*"
Remove-App "ZeptoLabUKLimited.CutTheRope"
Remove-App "ZhuhaiKingsoftOfficeSoftw.WPSOffice"
Remove-App "ZhuhaiKingsoftOfficeSoftw.WPSOfficeforFree"
Remove-App "ZinioLLC.Zinio*"
Remove-App "Zolmo.JamiesRecipes"
Remove-App "eBayInc.eBay*"
Remove-App "esobiIncorporated.newsXpressoMetro*"
Remove-App "fingertappsASUS.FingertappsInstrumentsrecommendedb*"
Remove-App "fingertappsASUS.JigsWarrecommendedbyASUS*"
Remove-App "fingertappsasus.FingertappsOrganizerrecommendedbyA*"
Remove-App "flaregamesGmbH.RoyalRevolt2*"
Remove-App "king.com*"
Remove-App "king.com.BubbleWitch3Saga"
Remove-App "king.com.CandyCrushFriends"
Remove-App "king.com.CandyCrushSaga"
Remove-App "king.com.CandyCrushSodaSaga"
Remove-App "king.com.ParadiseBay"
Remove-App "n-tvNachrichtenfernsehenG.n-tvNachrichten"
Remove-App "sMedioforHP.sMedio360*"
Remove-App "sMedioforToshiba.TOSHIBAMediaPlayerbysMedioTrueLin*"
Remove-App "zuukaInc.iStoryTimeLibrary*"


# Inactive identifers
#Remove-App "Netflix*"
#Remove-App "4DF9E0F8.Netflix"

##########
# Finish #
##########
# DO NOT REMOVE OR CHANGE (needs to be at end of script)
# Waits for Apps to be removed before Script Closes
Write-Output 'Finishing app removal, please wait...'
Wait-Job -Name "TronScript3rd*" | Out-null
Remove-Job -Name "TronScript3rd*" | Out-null
