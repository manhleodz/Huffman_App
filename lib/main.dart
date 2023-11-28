import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huffman coding',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

//
// import 'package:collection/collection.dart';
//
// class HuffmanNode implements Comparable<HuffmanNode> {
//   final int frequency;
//   final String character;
//   HuffmanNode? left;
//   HuffmanNode? right;
//
//   HuffmanNode(this.character, this.frequency);
//
//   @override
//   int compareTo(HuffmanNode other) {
//     return frequency - other.frequency;
//   }
//
//   bool get isLeaf => left == null && right == null;
// }
//
// class HuffmanDecoder {
//   HuffmanNode _buildTree(Map<String, int> frequencies) {
//     HeapPriorityQueue<HuffmanNode> priorityQueue = HeapPriorityQueue();
//     frequencies.forEach((key, value) {
//       priorityQueue.add(HuffmanNode(key, value));
//     });
//
//     while (priorityQueue.length > 1) {
//       HuffmanNode node1 = priorityQueue.removeFirst();
//       HuffmanNode node2 = priorityQueue.removeFirst();
//
//       HuffmanNode newNode =
//           HuffmanNode('\0', node1.frequency + node2.frequency);
//       newNode.left = node1;
//       newNode.right = node2;
//
//       priorityQueue.add(newNode);
//     }
//
//     return priorityQueue.removeFirst();
//   }
//
//   Map<String, String> _buildCodeTable(HuffmanNode? root) {
//     // Update: Nullable root parameter
//     Map<String, String> codeTable = {};
//     if (root != null) {
//       // Added null check
//       _buildCodeTableRecursive(root, '', codeTable);
//     }
//     return codeTable;
//   }
//
//   void _buildCodeTableRecursive(
//       HuffmanNode? node, String code, Map<String, String> codeTable) {
//     // Update: Nullable node parameter
//     if (node == null) {
//       // Added null check
//       return;
//     }
//
//     if (node.isLeaf) {
//       codeTable[node.character] = code;
//       return;
//     }
//
//     _buildCodeTableRecursive(node.left, code + '0', codeTable);
//     _buildCodeTableRecursive(node.right, code + '1', codeTable);
//   }
//
//   String decode(String encodedText, Map<String, int> frequencies) {
//     HuffmanNode root = _buildTree(frequencies);
//     Map<String, String> codeTable = _buildCodeTable(root);
//
//     String decodedText = '';
//     String currentCode = '';
//
//     for (int i = 0; i < encodedText.length; i++) {
//       currentCode += encodedText[i];
//       if (codeTable.containsValue(currentCode)) {
//         String character = codeTable.keys.firstWhere(
//           (key) => codeTable[key] == currentCode,
//           orElse: () => '',
//         );
//         if (character.isNotEmpty) {
//           decodedText += character;
//           currentCode = '';
//         }
//       }
//     }
//
//     return decodedText;
//   }
// }
//
// void main() {
//   String encodedText =
//       '01110100011111000101101011101000111'; // Example encoded text
//   Map<String, int> frequencies = {
//     'g': 2,
//     'e': 4,
//     'k': 2,
//     's': 2,
//     'f': 1,
//     'o': 1,
//     'r': 1
//   }; // Example frequencies
//
//   HuffmanDecoder decoder = HuffmanDecoder();
//   String decodedText = decoder.decode(encodedText, frequencies);
//
//   print('Decoded text: $decodedText');
// }
