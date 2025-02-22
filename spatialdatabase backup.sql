PGDMP                       }         	   spatialdb    15.6    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    70311 	   spatialdb    DATABASE     |   CREATE DATABASE spatialdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE spatialdb;
                postgres    false                        3079    70312    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            �           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    71446    spatial_points    TABLE     �   CREATE TABLE public.spatial_points (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255) NOT NULL,
    description text,
    location public.geometry(Point,4326) NOT NULL
);
 "   DROP TABLE public.spatial_points;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    71445    spatial_points_id_seq    SEQUENCE     �   CREATE SEQUENCE public.spatial_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.spatial_points_id_seq;
       public          postgres    false    221            �           0    0    spatial_points_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.spatial_points_id_seq OWNED BY public.spatial_points.id;
          public          postgres    false    220            �            1259    71455    spatial_polygons    TABLE     �   CREATE TABLE public.spatial_polygons (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    area public.geometry(Polygon,4326) NOT NULL
);
 $   DROP TABLE public.spatial_polygons;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    71454    spatial_polygons_id_seq    SEQUENCE     �   CREATE SEQUENCE public.spatial_polygons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.spatial_polygons_id_seq;
       public          postgres    false    223            �           0    0    spatial_polygons_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.spatial_polygons_id_seq OWNED BY public.spatial_polygons.id;
          public          postgres    false    222                       2604    71449    spatial_points id    DEFAULT     v   ALTER TABLE ONLY public.spatial_points ALTER COLUMN id SET DEFAULT nextval('public.spatial_points_id_seq'::regclass);
 @   ALTER TABLE public.spatial_points ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    71458    spatial_polygons id    DEFAULT     z   ALTER TABLE ONLY public.spatial_polygons ALTER COLUMN id SET DEFAULT nextval('public.spatial_polygons_id_seq'::regclass);
 B   ALTER TABLE public.spatial_polygons ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �          0    71446    spatial_points 
   TABLE DATA           R   COPY public.spatial_points (id, name, address, description, location) FROM stdin;
    public          postgres    false    221   �&       �          0    71455    spatial_polygons 
   TABLE DATA           G   COPY public.spatial_polygons (id, name, description, area) FROM stdin;
    public          postgres    false    223   j(                 0    70630    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    216   �)       �           0    0    spatial_points_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.spatial_points_id_seq', 3, true);
          public          postgres    false    220            �           0    0    spatial_polygons_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.spatial_polygons_id_seq', 3, true);
          public          postgres    false    222                       2606    71453 "   spatial_points spatial_points_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.spatial_points
    ADD CONSTRAINT spatial_points_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.spatial_points DROP CONSTRAINT spatial_points_pkey;
       public            postgres    false    221                       2606    71462 &   spatial_polygons spatial_polygons_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.spatial_polygons
    ADD CONSTRAINT spatial_polygons_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.spatial_polygons DROP CONSTRAINT spatial_polygons_pkey;
       public            postgres    false    223                       1259    71463    spatial_points_gix    INDEX     P   CREATE INDEX spatial_points_gix ON public.spatial_points USING gist (location);
 &   DROP INDEX public.spatial_points_gix;
       public            postgres    false    221    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2                       1259    71464    spatial_polygons_gix    INDEX     P   CREATE INDEX spatial_polygons_gix ON public.spatial_polygons USING gist (area);
 (   DROP INDEX public.spatial_polygons_gix;
       public            postgres    false    223    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2            �   l  x�m�Ao� ��)�i��`p��l�T������r�26�Fͧ/�Vi���I<����YcUۃTs0-��8cFKJ���W�����6�)�q[��T�˽;;�����@�	��&,q�[i��w��Es��[�wB����vZ�슥 e#8-ECJ�D.I��M�d*6�眬X��x@jc4�l3�h����N��Oá��? �OЩ�����}\��A���fZ��qˊ�ؓ��qz5����,���1�~ktG�^���6`�x��������,<��5��~�_�ğP���� ��=�M�m���+c\�_a�UuK/DNX]W4����7���d%�[�V��'�1��      �   A  x����N�0���S�����c�&7$�1N\���H%-m&���ۀ�M� ��%�/9�Erۆh�ewm�ml�m`����d�dݩ[���Ѳ�����g�$�\�5n,=^��w��7n�p���ʸ�?�p:�r�$ T)~��(�;/��s�����i�<���o�2��X������cO�6Զ߱v;���ԛ�X�V�GW��߼�)t�K�a�KBŕ1s�%r)Ve5�Bʦ9���d!��0�+�)~�B�l��m�����9[�(#1�A(]�rQ�9����	CS��$%�iN*�(��9^�O�K��q���;���n            x������ � �     