<?php
/**
 * Created by AlbaFox.
 * Author: Kevin Marques
 * Date: 12/06/2018 - 11:05
 * Grh : init.php
 */

include "init.php";

    switch (_page){
        case _system_index:
        case _system:
            switch (_level1){
                case 'sessionTime':

                    break;
                case 'authenticate':
                    $loginAuth = new \Modules\Access();
                    $loginAuth->authenticate();
                    break;
                case 'logout':
                    $loginAuth = new \Modules\Access();
                    $loginAuth->logout();
                    break;
                case 'session':
                    $session = new \Modules\Access();
                    $session->session();
                    break;
                case 'change_profile':
                    $profile = new \Modules\Application();
                    $profile->makeProfileChange(_level2,_level3);
                    break;
                case 'recover':
                    switch (_level2){
                        case 'save':
                            $saveData = new \Modules\Access();
                            $saveData->saveNewPassword(_level3);
                            break;
                        default:
                            $recover = new \Modules\Access();
                            $recover->recoverPassword(_level2);
                            break;
                    }
                    break;
                default:
                    try{
                        //Atribuição de Variaveis
                        $action = [];
                        $action[] = empty(_level1) ? null : _level1;
                        $action[] = empty(_level2) ? null : _level2;
                        $action[] = empty(_level3) ? null : _level3;
                        $action[] = empty(_level4) ? null : _level4;
                        $action[] = empty(_level5) ? null : _level5;
                        $Engine = new Engine($action);
                        $Engine->requestMediator();
                    }
                    catch (\Exceptions\EngineException $exception){
                        $error = [];
                        $error['type'] = 'error';
                        $error['title'] = _tr('engine_error');
                        $error['msg'] = $exception->getMessage();
                        echo json_encode($error);
                    } catch (ErrorException $exception) {
                        $error = [];
                        $error['type'] = 'error';
                        $error['title'] = _tr('internal_error');
                        $error['msg'] = $exception->getMessage();
                    } catch (\Exceptions\PermissionException $exception) {
                        $error = [];
                        $error['type'] = 'error';
                        $error['title'] = _tr('permission_error');
                        $error['msg'] = $exception->getMessage();
                    }

                    break;
            }
            break;
        default:
            //echo $_SERVER['REMOTE_ADDR'];
            //
            header("Location: ".WWW_PATH);
            //header("Location: "."App/");
            break;
    }

        ?>
