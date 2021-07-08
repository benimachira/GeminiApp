import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';

class CustomData {
  CustomData();

  List<String> category_list = [
    'Cereal',
    'Vegetable',
    'Fruits',
    'Nuts',
    'Fodder'
  ];
  List<Map<String, dynamic>> open_payment_data = [
    {
      'name': 'Order #474PESQ',
      'description':
          'You have made sales worth Ksh 12,000 Today. And made profit of KES 2,300',
      'time': '12:10 am',
      'status': 0,
    },
    {
      'name': 'Order #472PESQ',
      'description':
          'You have made sales worth Ksh 43,000 Today. And made profit of KES 7,00',
      'time': '08:00 pm',
      'status': 0,
    },
    {
      'name': 'Order #472PESR',
      'description':
          'You have made sales worth Ksh 3,000 Today. And made profit of KES 200',
      'time': '02:00 am',
      'status': 0,
    }
  ];
  List<Map<String, dynamic>> closed_payment_data = [
    {
      'name': 'Order #471PESP',
      'description':
          'You have made sales worth Ksh 3,000 Today. And made profit of KES 1,300',
      'time': '01:20 pm',
      'status': 0,
    },
    {
      'name': 'Order #472PESP',
      'description':
          'You have made sales worth Ksh 33,000 Today. And made profit of KES 12,300',
      'time': '05:50 pm',
      'status': 0,
    },
    {
      'name': 'Order #473PESP',
      'description':
          'You have made sales worth Ksh 3,000 Today. And made profit of KES 2,300',
      'time': '01:50 pm',
      'status': 0,
    },
  ];

  List<Map<String, dynamic>> notification_date = [
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Info_Circle.svg',
      'title': 'Today’s Order has arrived',
      'text': 'Order has arrived at your pickup location Langata Market center',
      'action_required': 0,
      'action_message': '',
      'time': '2 min ago',
      'not_type': 2
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Info_Circle.svg',
      'title': 'End of day Summary.',
      'text':
          'You have made sales worth Ksh 3,000 Today. Amount due to go Ksh 1,200',
      'action_required': 1,
      'action_message': 'Make your daily payment',
      'time': '',
      'not_type': 1
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Chart.svg',
      'title': 'Your order is prepared.',
      'text':
          'Your order is currently being prepared. Should be delivered Tomorrow at 08:00 am',
      'action_required': 0,
      'action_message': '',
      'time': '45 min ago',
      'not_type': 4
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Add_User.svg',
      'title': 'A team member has contacted you',
      'text':
          'I have been contacted by 3 people wanting to join the organization as retailers',
      'action_required': 1,
      'action_message': 'Reply',
      'time': 'Today 03:30 am',
      'not_type': 3
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Chart.svg',
      'title': 'End of day Summary.',
      'text':
          'You have made sales worth Ksh 3,000 Today. Amount due to go Ksh 1,200',
      'action_required': 1,
      'action_message': 'Make your daily payment',
      'time': 'Today 07:30 am',
      'not_type': 1
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Add_User.svg',
      'title': 'Today’s Order has arrived',
      'text': 'Order has arrived at your pickup location Langata Market center',
      'action_required': 0,
      'action_message': '',
      'time': 'Yesterday 06:00 pm',
      'not_type': 2
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Info_Circle.svg',
      'title': 'A team member has contacted you',
      'text': 'Please help Nyambura from westlands zone with... ',
      'action_required': 1,
      'action_message': 'Reply',
      'time': '12 April 2021',
      'not_type': 3
    },
    {
      'id': 0,
      'icon_not': 'assets/images/Iconly_Two_tone_Chart.svg',
      'title': 'Your order is prepared.',
      'text':
          'Your order is currently being prepared. Should be delivered Tomorrow at 08:00 am',
      'action_required': 0,
      'action_message': '',
      'time': '08 July 2021',
      'not_type': 4
    },
  ];

  List<Map<String, dynamic>> inventory_data = [
    {
      'name': 'Onions',
      'id': 1,
      'price': 400,
      'price_max': 500,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/onion.jpg',
    },
    {
      'name': 'Cabbage Red',
      'id': 2,
      'price': 40,
      'price_max': 50,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/redcabbage.jpg',
    },
    {
      'name': 'Tomato',
      'id': 3,
      'price': 120,
      'price_max': 150,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description': '',
      'image': 'assets/images/tomato.jpeg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
    },
    {
      'name': 'Pepper Green',
      'id': 4,
      'price': 60,
      'price_max': 80,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/peppergreen.jpg',
    },
    {
      'name': 'Maize',
      'id': 5,
      'price': 80,
      'price_max': 100,
      'pack_quantity': 10,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/maize.jpg',
    },
    {
      'name': 'Red beans',
      'id': 6,
      'price': 220,
      'price_max': 280,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/red_beans.jpg',
    },
    {
      'name': 'Skuma wiki',
      'id': 7,
      'price': 40,
      'price_max': 80,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/skuma_wiki.jpg',
    },
    {
      'name': 'Peas',
      'id': 8,
      'price': 200,
      'price_max': 300,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/peas.jpeg',
    },
    {
      'name': 'Carrots',
      'id': 9,
      'price': 50,
      'price_max': 60,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/carrot.jpg',
    },
    {
      'name': 'Wheat',
      'id': 10,
      'price': 100,
      'price_max': 200,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/wheat.jpg',
    },
    {
      'name': 'Yams',
      'id': 11,
      'price': 600,
      'price_max': 700,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/red_beans.jpg',
    },
    {
      'name': 'Arrow root',
      'id': 12,
      'price': 200,
      'price_max': 300,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/arrow_roots.jpg',
    },
    {
      'name': 'Mango',
      'id': 13,
      'price': 60,
      'price_max': 70,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/mango.jpg',
    },
    {
      'name': 'Passion',
      'id': 14,
      'price': 30,
      'price_max': 80,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/passion.jpg',
    }
  ];

  List<Map<String, dynamic>> inventory_data_custom = [
    {
      'name': 'Tomato',
      'id': 3,
      'price': 120,
      'price_max': 150,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'description': '',
      'image': 'assets/images/tomato.jpeg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
    },
    {
      'name': 'Pepper Green',
      'id': 4,
      'price': 60,
      'price_max': 80,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/peppergreen.jpg',
    },
    {
      'name': 'Onions',
      'id': 1,
      'price': 400,
      'price_max': 500,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/onion.jpg',
    },
    {
      'name': 'Maize',
      'id': 5,
      'price': 80,
      'price_max': 100,
      'pack_quantity': 10,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/maize.jpg',
    },
    {
      'name': 'Red beans',
      'id': 6,
      'price': 220,
      'price_max': 280,
      'pack_quantity': 2,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/red_beans.jpg',
    },
    {
      'name': 'Mango',
      'id': 13,
      'price': 60,
      'price_max': 70,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/mango.jpg',
    },
    {
      'name': 'Passion',
      'id': 14,
      'price': 30,
      'price_max': 80,
      'pack_quantity': 1,
      'measure_unit': 'Kg',
      'qr_status':0,
      'description':
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
      'image': 'assets/images/passion.jpg',
    }
  ];

  List<Map<String, dynamic>> people_data = [
    {
      'name': 'Anderson Miksasa',
      'id': 1,
      'email': 'aba@gmail.com',
      'phone': '07000001',
      'avatar': 'assets/images/avatars/pass_01.jpg',
    },
    {
      'name': 'Mildra Wanaina',
      'id': 2,
      'email': 'abb@gmail.com',
      'phone': '07000002',
      'avatar': 'assets/images/avatars/pass_02.jpg',
    },
    {
      'name': 'Wiklink wendo',
      'id': 3,
      'email': 'abc@gmail.com',
      'phone': '07000003',
      'avatar': 'assets/images/avatars/pass_03.jpg',
    },
    {
      'name': 'Mama joy Maina',
      'email': 'abe@gmail.com',
      'id': 4,
      'phone': '07000004',
      'avatar': 'assets/images/avatars/pass_04.jpg',
    },
    {
      'name': 'Wendani Mboga',
      'email': 'aca@gmail.com',
      'id': 5,
      'phone': '07000005',
      'avatar': 'assets/images/avatars/pass_05.jpg',
    },
    {
      'name': 'Wamama Kibera',
      'email': 'acb@gmail.com',
      'id': 6,
      'phone': '07000006',
      'avatar': 'assets/images/avatars/pass_06.jpg',
    },
    {
      'name': 'Eliza Ondieki',
      'email': 'acd@gmail.com',
      'id': 7,
      'phone': '07000007',
      'avatar': 'assets/images/avatars/pass_07.jpeg',
    }
  ];

  List<ModelInventory> convert_product(var list) {
    // Iterable<ModelInventory> medical_service =
    //     list.map((json) => ModelInventory(json));
    // return medical_service.toList();

    List<ModelInventory> networkOptions =
        list.map<ModelInventory>((x) => ModelInventory(x)).toList();

    List<ModelInventory> weightData =
        list.entries.map((entry) => ModelInventory(entry)).toList();
    print(weightData.length);

    list.map((title) => ModelInventory(title)).toList();

    return networkOptions;
  }

  List<ModelInventory> invetory() {
    List<ModelInventory> inventory_list = convert_product(inventory_data);
    return inventory_list;
  }
}
