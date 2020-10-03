GDPC                                                                            #   D   res://.import/asteroid_0.png-087027e5a208749cfc23b226b7fbffff.stex  �(      �      E�]:aϑ5�sa��L   res://.import/asteroid_sample_0.png-fbc808d3e69a2d7ce47bafc79628b4b1.stex    -            ��2�c����Y��+<   res://.import/icon.png-82ea131e750a89467e27b5ff9b11ce77.stex�0      U      �G͍r&E�`� �g��H   res://.import/module_thrust.png-2d306b23485cb36878d340f061d258c8.stex   �@      �      L)��:?$�>�`�ش@   res://.import/moon_0.png-4aacfcfdb9dd25d38a23ce83cc58cf43.stex  `E            =�L�c�E��'�=+ߊD   res://.import/ship_back.png-8859dadf690886c5fc99b5b9127df053.stex    L      �       ��|���� $��e�H   res://.import/ship_complete.png-0f4101af299b216c9bfdbc90727d8b75.stex   �O      �      ��E�����JD   res://.import/ship_core.png-9edeec6cc5e29493750b0eca748c6781.stex    U      �      8{�H(��<�^����eD   res://.import/ship_front.png-0326b719057a15b75f202c411a8f2c85.stex  0Y            �e-뗄.g�f�i���   res://default_env.tres  �
      �       um�`�N��<*ỳ�8   res://project.binary�]      P      \�($m��MU�U�]   res://scenes/Background.tscn�      �       }� >���^q�Ql�ސ   res://scenes/Camera.tscnP      �      mDq�N�K�L�;��   res://scenes/DebugMenu.tscn �      $      ڃ�S��Q����{�:   res://scenes/Main.tscn         �      a*�Y�;:R�\�W   res://scenes/Player.tscn�            �%�gsC��b��G�   res://scenes/Target.tscn       �       i�F�Aܵ1�&U��     res://scenes/TargetSpawner.tscn �      �       ��_ԘK�I��6|Z��    res://scripts/Camera.gd.remap   �\      )       ����<�+��Q� 0��   res://scripts/Camera.gdcp      7      +�/����|r+G�U    res://scripts/DebugMenu.gd.remap]      ,       �"!�`[fUд�s��   res://scripts/DebugMenu.gdc �      H      ��/��in�I���a(    res://scripts/Player.gd.remap   @]      )       �g��і��CY�e�<e�   res://scripts/Player.gdc       �
      6`^QY�I)o&ݙ��$   res://scripts/TargetSpawner.gd.remapp]      0       ���&p�l��(�.�    res://scripts/TargetSpawner.gdc �"      �      W���P��C�$   res://sprites/asteroid_0.png.import �*      �      ���d!���f#��
f,   res://sprites/asteroid_sample_0.png.import  0.      �      `8�Ӡ҄�V�+�pg�w    res://sprites/icon.png.import   @>      �      �̰X��pϳj�@��7(   res://sprites/module_thrust.png.import  �B      �      ���qȭ��ӈI��!>�    res://sprites/moon_0.png.import pI      �      j��V���*�,$   res://sprites/ship_back.png.import  �L      �      q8�DjȟtZI>�~(   res://sprites/ship_complete.png.import  PR      �      c@7�ۼ�4jr�BC$   res://sprites/ship_core.png.import  �V      �      &���(�&�H���$   res://sprites/ship_front.png.import @Z      �      �i��	��`^]og���    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [gd_scene load_steps=2 format=2]

[ext_resource path="res://sprites/ship_front.png" type="Texture" id=1]

[node name="Background" type="Sprite"]
scale = Vector2( 64, 64 )
texture = ExtResource( 1 )
          [gd_scene load_steps=3 format=2]

[ext_resource path="res://scripts/Camera.gd" type="Script" id=1]
[ext_resource path="res://scenes/DebugMenu.tscn" type="PackedScene" id=2]

[node name="Camera2D" type="Camera2D"]
current = true
script = ExtResource( 1 )

[node name="DebugMenu" parent="." instance=ExtResource( 2 )]
visible = false
margin_left = 320.0
margin_top = 112.0
margin_right = 512.0
margin_bottom = 304.0
  [gd_scene load_steps=2 format=2]

[ext_resource path="res://scripts/DebugMenu.gd" type="Script" id=1]

[node name="DebugMenu" type="Panel"]
margin_left = 832.0
margin_top = 408.0
margin_right = 1024.0
margin_bottom = 600.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}
            [gd_scene load_steps=5 format=2]

[ext_resource path="res://scenes/Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://scenes/TargetSpawner.tscn" type="PackedScene" id=3]
[ext_resource path="res://scenes/Camera.tscn" type="PackedScene" id=4]
[ext_resource path="res://scenes/Background.tscn" type="PackedScene" id=5]

[node name="GameScene" type="Node"]

[node name="Camera2D" parent="." instance=ExtResource( 4 )]

[node name="Background" parent="." instance=ExtResource( 5 )]

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 200, 200 )
rotation = -4.78744

[node name="TargetSpawner" parent="." instance=ExtResource( 3 )]
max_dist = 256
min_dist = 64
         [gd_scene load_steps=4 format=2]

[ext_resource path="res://sprites/ship_core.png" type="Texture" id=1]
[ext_resource path="res://scripts/Player.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 31.9801, 32.6936 )

[node name="Player" type="KinematicBody2D"]
script = ExtResource( 2 )

[node name="icon" type="Sprite" parent="."]
rotation = -1.5708
scale = Vector2( 3, 3 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
              [gd_scene load_steps=2 format=2]

[ext_resource path="res://sprites/moon_0.png" type="Texture" id=1]

[node name="Planet" type="Sprite"]
scale = Vector2( 3, 3 )
texture = ExtResource( 1 )
    [gd_scene load_steps=2 format=2]

[ext_resource path="res://scripts/TargetSpawner.gd" type="Script" id=1]

[node name="TargetSpawner" type="Node"]
script = ExtResource( 1 )
   GDSC         
   (      �����ׄ򶶶�   �����Ķ�   �����϶�   �������Ӷ���   �������Ŷ���   ����׶��   �������ض���   ϶��   	   ../Player                                                       	   &   
   3YY;�  YY0�  PQV�  �  �  PQYY0�  P�  QV�  �  T�  �  T�  T�  Y`         GDSC            +      ����ڶ��   �������Ŷ���   �����׶�   ����¶��   ���������������������Ҷ�   ������Ӷ   �������Ӷ���   ���¶���      ui_home       ui_end                     
                  !      )      3YY0�  P�  QV�  &�  T�  PQV�  �  �  �  &�  T�  P�  QV�  �  PQT�  PQY`        GDSC   (   
   o   �     ������������τ�   ������������Ķ��   �����϶�   �������Ӷ���   �����������Ķ���   ��������������¶   �������Ӷ���   ������Զ   �����������¶���   ����Ҷ��   �������϶���   ��������¶��   ����¶��   ����������������Ҷ��   �������Ŷ���   ������������������������ض��   ������¶   ����������ٶ   ������Ŷ   �������ض���   ��������Ŷ��   �����¶�   ���¶���   ���������Ӷ�   ������������Ӷ��   ��Ŷ   ��������������Ӷ   �����޶�   ���������������Ŷ���   ����׶��   �������������Ҷ�   ���ж���   ��¶   ������Ҷ   ����������ض   ������¶   ������Ҷ   ����Ӷ��   �������ض���   �������������Ӷ�      ../TargetSpawner  z ���!	@                 �      
   addGrapple        removeGrapple                                                                         	      
   "      #      $      %      .      /      0      5      :      C      D      K      L      M      N      O      P      Q      R      S      T      Z       c   !   j   "   {   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?     @     A   	  B   
  C     D     E     F     G     H     I   $  J   %  K   )  L   *  M   +  N   8  O   <  P   @  Q   A  R   B  S   C  T   G  U   P  V   T  W   U  X   l  Y   m  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   3YYY;�  Y0�  PQV�  �  �  PQYY;�  �  YY;�  �  PQYYYY8P�  Q;�  �  YYY;�  �  Y;�  �  Y8P�  Q;�	  �  YY;�
  �  PQYY�  Y�  YYYYY0�  PQV�  &�  T�  P�  QV�  ;�  �  PQ�  ;�  �  T�  P�  T�  L�  MT�  Q�  ;�  �  T�  L�  MT�  �  )�  �  T�  V�  ;�  �  T�  P�  T�  Q�  &�  	�  V�  �  �  �  �  �  T�  �  �  �  P�  QY�  &�  T�  P�  QV�  �  PQ�  YYY0�  PQV�  �  �  S�  �  �  SYYY0�  P�  QV�  �  �  S�  �  �  S�  �  �  YYY0�  PQV�  �  �  S�  �  �  S�  �  P�  �  QT�  PQYYYY0�  P�  QV�  �  PQ�  ;�  �  SY�  Y�  ;�  �  SY�  &�  V�  �  �  &�
  T�   P�  �  Q	�  V�  �  PQ�  &�  V�  �  Y�  �  �  �  �  �  T�!  P�  Q�  �  �  Y�  ;�"  �
  T�#  P�  �  QT�$  PZ�	  QT�%  PQY�  &�  P�  R�  QT�$  P�"  QT�   P�  P�  R�  QT�$  P�&  QQ	�  V�  �"  Z�  �&  �"  Y�  �  �  Y�  �  �  �  Y�  �  �  �  Y�  �
  �  P�	  R�  QT�$  P�&  Q�  �
  �'  P�
  QYY`         GDSC      	   0        ���Ӷ���   ����������޶   �������������Ҷ�   �������¶���   �������¶���   �����������Ӷ���   �����Ķ�   ������Ŷ   ��������¶��   �����϶�   �������Ӷ���   ����������¶   ���������¶�   �������Ӷ���   �������ض���   ϶��   ζ��   �����Ҷ�   ��������Ҷ��   �������¶���   �������Ŷ���   �����׶�   �����������¶���   ���������Ӷ�   �����Ӷ�               �                res://scenes/Target.tscn   	   ../Player                                         	                                 	       
   #      $      *      -      .      4      ;      B      F      G      M      V      _      g      n      s      w      x            �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -   	  .     /     0   3YY8;�  Y8;�  �  YY8;�  �  Y8;�  �  YY;�  Y;�  YY;�  LMY;�  YY0�	  PQV�  �  ?P�  Q�  �  �
  P�  Q�  �  PQYY0�  PQV�  ;�  �  T�  PQ�  �  T�  T�  �  �  �  T�  T�  �  �  �  T�  P�  Q�  �  P�  Q�  �  PQYY0�  P�  QV�  &�  L�  MT�  T�  �  T�  T�  	�  V�  �  PQ�  &�  T�  T�  �  L�  MT�  T�  	�  V�  �  L�  MT�  PQ�  �  T�  P�  QYYY0�  PQV�  ;�  �  T�  PQ�  �  T�  T�  �  L�  MT�  T�  �  �  �  T�  T�  �&  PQ�  �  �  �  �  T�  P�  Q�  �  P�  Q�  �  PQYY0�  PQV�  �%  PQ�  �  �&  PQP�  �  Q�  YY`         GDST               �  PNG �PNG

   IHDR         �w=�   sRGB ���  �IDATH��V��� \�<SQ�_ȧ�*��#�g
4�j�Μ��MvC8���� �}[{���nQA��B���C���Ir~��3�'�9#�0||�2�M�BDj�j]D
�Jz��ɥI����D5��b����[����e۶��g�RB��̰���o��U�z����MA����|>-��H*�K)�C�,�9gՓ}�AD��h$��c������&5/�s
0v���۶�$Ӳ&"��//�t�M.����B��i7 \/ٌ٧�<�V�H)>y�V�g�EP�֜�GJ	�� {�h�ڜG3��y��7�5"��<��,=�{^۷&�����I�� ���0K�{�'^}}2gh�<�TG���Yy�_��6�V><�W�@}*o�=� �m�r�+@�    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/asteroid_0.png-087027e5a208749cfc23b226b7fbffff.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/asteroid_0.png"
dest_files=[ "res://.import/asteroid_0.png-087027e5a208749cfc23b226b7fbffff.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
     GDST               �   PNG �PNG

   IHDR         ��a   sRGB ���   �IDAT8��S�1V)�R(�R�|�3�k%�>���`@�����H���f�w��Tu3���yZ��`  ���6�'H pw��<d61.�h�����Px�.<�qFw����{���9z	�}bC,�_�X�ޑ1�d��G�ֹ'而��(;W~������!j�^���W�+7�    IEND�B`�    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/asteroid_sample_0.png-fbc808d3e69a2d7ce47bafc79628b4b1.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/asteroid_sample_0.png"
dest_files=[ "res://.import/asteroid_sample_0.png-fbc808d3e69a2d7ce47bafc79628b4b1.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST@   @            9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-82ea131e750a89467e27b5ff9b11ce77.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/icon.png"
dest_files=[ "res://.import/icon.png-82ea131e750a89467e27b5ff9b11ce77.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
       GDST                �  PNG �PNG

   IHDR          w }Y   sRGB ���  yIDATH��T�n�0�<Ԡ�,xRQ�
� ��
��H����jP_��*p@a%8���s�!�|?�}���xE���7騳�?�r�:�D�~!mmM9`�{  ���sf�t$G�Y/x( ���v�¶��v�Y(��'�B,Iڔ�d6�/5�FI(�7 ��tVJ1b�Dۙ���ا4倯	ق
�1��wK���$F0�f�;ʄ�vbHx_]����T|��?"5G�o�s��#dɲ�gq����~I��ld��6�x�@l�E mWЯ�������k�F��R~�:��<N{��;=SH�"���!"Z���c4�E����p���ۮ�Ed��E4�*�%p:���WU320)0u6��/<�� s��    IEND�B`� [remap]

importer="texture"
type="StreamTexture"
path="res://.import/module_thrust.png-2d306b23485cb36878d340f061d258c8.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/module_thrust.png"
dest_files=[ "res://.import/module_thrust.png-2d306b23485cb36878d340f061d258c8.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
            GDST@   @            �  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��[ە� T�l!���)�Nr?6���� |�k7��Fd��1r�GPk�DO��z"$�o4�d�tm��_#��3(`�38��Z+�!�'�4s�1a��V���[�R
  �֤���
p4d��~�5s�K=,	/u�����a8UEk����0�W`�b<�y�$wX�vE�(H3�b��x%`���]h�~�w2���|b�u�žw�'�s� �h��V�T@Ɲ�E�)�LG߄PT���GO��vu�N	��캲$ ($�����D�T2[�`H�\4���=�]牄_�j�+e��]�AW��W[J�RJ8Wk���K���o���x�{��Zk:��z�f�	H��\To�k�(2k�̹�B�jFD���J2�� 4Zp�4(�V��悗�: ��::=�R��^Q���ICB�>يDR6<��K��N�}Gh� �ZKͱ���d�k��iz�_v��a+�s{�>B�݂�jen� ��r�
�!@�J܂��`	�- �T�����l� kkm��>�D�0ӫCH$x�8w�<��ѿ<�2�ʮ���V�A�������	��XJ�4+ �#����̖X����+�����+��з�f�T��%J ��3-m}�+}Z�2%������P���`�?�}F��5�{)�I��[,�y=" @&�a|)�k�p�%  ��YX�����ἐ��������$h�|���Z�:@,�V�@�Xe<���q�PP�EVPǹa�AI �u�S�Yy$ �P�
��F�xv�CrO ߊR�Qn���N�c]BR���[�U�Ɲ0�! ���"%�o]�»�d�	ꅁUs��EB�W`^D'�/��� �	�|o�,�{��&ͦ�w�>|R��u�O�4����:R���v׳@#���^6��    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/moon_0.png-4aacfcfdb9dd25d38a23ce83cc58cf43.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/moon_0.png"
dest_files=[ "res://.import/moon_0.png-4aacfcfdb9dd25d38a23ce83cc58cf43.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
 GDST               �   PNG �PNG

   IHDR         �m8   sRGB ���   �IDAT(�����0ψ���X��0
#!1
3� PP"��%R�W��~��b�!##�/Q�D����q)S�� y.� C{ �5U�y�~0o�-���^7XQh]Aml�k_=��e�"�0Q�:��X�s7bZ&�m�    IEND�B`�   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ship_back.png-8859dadf690886c5fc99b5b9127df053.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/ship_back.png"
dest_files=[ "res://.import/ship_back.png-8859dadf690886c5fc99b5b9127df053.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
        GDST   0            �  PNG �PNG

   IHDR      0   ���   sRGB ���  LIDATX��V�j�@=
.]�dHa��	ȅ>"��Ŭ��iҬ��
�T$�"���#H��.��f&wF�L�=�0su��s����x��@&=��0����8����	Xșam�6p�IGIu����7UU��3:�3��?"�����! �6��  �:��ʐ�YE\!Lr�<鰞���X��-���o������/��C\k��?�\p�  ��~/p9������� !�1���Œ�s,gS"k����}Gj��l>!:
.��px�)�<餵O��<�ȓ�D�I���������<pT�6 �{�6�������ZΦX�:�xJ�ǅ��g�gWOؾ�b�z���'d��+L^�~UUH�MӠi�i*�ZGp����͍��}E��b�e�9�<(�Q��j�x�BE(��K�K �c!��}������s � �͟s j��a�@����Alf�Dz�h�EF>G�<�(x*B�EÛH7�� �#�$ D@;*\��h|����Hibyi��7����䪰%���(rj�{�ꪈqCZ�jІS�!��GB�%9 "�X֝���T��������ױ��U���a-    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ship_complete.png-0f4101af299b216c9bfdbc90727d8b75.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/ship_complete.png"
dest_files=[ "res://.import/ship_complete.png-0f4101af299b216c9bfdbc90727d8b75.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
            GDST               j  PNG �PNG

   IHDR         �ȝ�   sRGB ���   IDAT(���1��0E%EN R
�6�Ma
�A�B��zS�FJ�5(�"m�H�R8EJ$oA�{Q�+k���X{B�R�'`aV����z ���������De�IL]����sm �'�7�V�kg�Sē�g��LL���LC5iUCe�ޝ�_W�+ֻ3e�;�.,k���yN۶�mK��H)�{;����<F�%�����m�`]ׄa�G�"Ҕ0���5(�ac9ʷU�C�~ ������
�x[r�?ƍ��)�?_k�'�Ps�������`x�9ݍNu~Ǜ�~M�z���̯    IEND�B`�          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ship_core.png-9edeec6cc5e29493750b0eca748c6781.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/ship_core.png"
dest_files=[ "res://.import/ship_core.png-9edeec6cc5e29493750b0eca748c6781.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
        GDST
               �   PNG �PNG

   IHDR   
      Fn   sRGB ���   �IDAT�}ϱ�0���%��,`
F��T�b �����鲁��H�"�e����O�w
�@e2�m���n��@�p� ��A���G% IV)���b�n�.�u@��Kױ=q�G�:����"\��c�#�a�9d��(k-�8��>_� �s�~�a�(k����| �A�[\l�    IEND�B`�    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ship_front.png-0326b719057a15b75f202c411a8f2c85.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/ship_front.png"
dest_files=[ "res://.import/ship_front.png-0326b719057a15b75f202c411a8f2c85.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
     [remap]

path="res://scripts/Camera.gdc"
       [remap]

path="res://scripts/DebugMenu.gdc"
    [remap]

path="res://scripts/Player.gdc"
       [remap]

path="res://scripts/TargetSpawner.gdc"
ECFG      _global_script_classes             _global_script_class_icons             application/config/name         ld-47      application/run/main_scene          res://scenes/Main.tscn     application/config/icon         res://icon.png     importer_defaults/texture\              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d               flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/up`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      
   input/down`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      
   input/left`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/right`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/addGrapple�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         input/removeGrapple�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      )   rendering/environment/default_environment          res://default_env.tres  