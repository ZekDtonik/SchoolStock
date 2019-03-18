<?php
/**
 * Created by MarxMedia.
 * Author: Kevin Marques
 * Date: 02/07/2018 - 20:46
 * Grh : app.php
 */

    include "init.php";
?>
<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <?php include "Templates/head.php";
    \Modules\System::noScript();
    $title = new \Modules\Title();
    $title->setPrefix(_MDPREFIX); ?>
    <title>Grh - Aplicação</title>
</head>
<body>
<section id="Wrapper">
    <?php

    try{

        $login = new \Modules\Access();

        if(!$login->checkLoginStatus()){
            switch (_page){
                case 'recover':
                    $title->setTitle(_tr("system_locale/title_system_recover"));
                    switch (_level1){
                        case 'newPassword':
                            $login->guiNewPassword();
                            break;
                        default:
                            $login->guiRecover();
                            break;
                    }


                    break;
                default:
                    $title->setTitle(_tr("system_locale/title_system_access"));
                    $login->guiLogin();
                    break;
            }
        }
        else{
            try{
                //include "Core/Modules/Kernel/Class.Application.module";
                $application = new \Modules\Application();
                $application->contentStart();
                switch (_page){
                    case 'Home':
                    case '':
                        $title->setTitle(_tr('system_locale/title_home_page'));
                        $map = [];
                        $map['link_doc']   = "/Docs/Manual_SchoolStock.pdf";
                        $map['version_doc'] = "1.0.9_r4";
                        $template = new Modules\Template\Template(ROOT_PATH.DS."Templates/View/home.model",$map,true);
                        echo $template->showTemplate();
                        break;
                    case 'Profile':
                    case 'profile':
                    case _profile:
                        $title->setTitle(_tr('system_locale/title_profile_page'));
                        $application->profile();
                        break;
                    default:
                        $titleDefinedByEngine = null;
                        $actionInterface = null;
                        $Engine = new Engine(_page,_level1,_level2,_level3,_level4,_level5);
                        $Engine->pageMediator($titleDefinedByEngine,$actionInterface);
                        $title->setTitle($titleDefinedByEngine);
                        break;
                }
                $application->contentEnd();
            }
            #CATCH PARA PERMISSÃO
            catch (\Exceptions\PermissionException $permissionException){
                \Modules\BoxMessage::containerShow('ais-lock',_tr('access_denied'),$permissionException->getMessage(),false);
            }

        }
    }
    #CATCHS DA PÁGINA TODA
    catch (\Exceptions\EngineException $e) {
        \Modules\BoxMessage::containerShow('ais-wrong',_tr('engine_error'),$e->getMessage());
    }
    catch (ErrorException $e) {
        \Modules\BoxMessage::containerShow('ais-wrong',_tr('engine_error'),$e->getMessage());
    }
    catch (PDOException $e) {
        \Modules\BoxMessage::containerShow('ais-wrong',_tr('database_error'),$e->getMessage());
    }
    ?>
</section>
<?php
    $title->start();
    include "Templates/footer.php";
?>
</body>
</html>
