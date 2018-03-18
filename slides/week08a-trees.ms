
.TL
.gcolor blue
Working with Trees
.gcolor
.LP
.ce 1
Week 8
.SS Overview
.IT The Tree ADT
.IT Tree traversal
.IT 
.IT 
.IT 
.SS The Tree ADT
.IT A tree is a \fIhierarchical\fR ADT
.IT A Tree is a set of elements (nodes) defined by a parent relation
.i1 One node is the \fIroot\fR
.i2 The root node is the \fBonly\fR node with no parent
.i1 All other nodes have exactly 1 parent node
.IT The children of a node are commonly referred to as
.i1 The \fIright node\fR, and
.i1 The \fIleft node\fR
.i1s
A simple tree

.CW
    template <class T>
    struct tree {
       T value;
       tree<T>* left = nullptr;
       tree<T>* right = nullptr;
   };
.R
.i1e
.SS Tree traversal
.IT A traversal of a data structure visits each element of the structure
.i1 iterator
.IT For a sequential data structure
.i1 Traversal typically visits elements from first to last

.IT Where is 'first' and 'last' in a tree??
.bp
.IT A traversal of a data structure visits each element of the structure
.i1 iterator
.IT For a linear data structure
.i1 Traversal typically visits elements from first to last

.IT Where is 'first' and 'last' in a tree??
.i1 Different sequences are possible 
.i1 The most common tree traversals are: 
.i2 preorder, 
.i2 inorder, 
.i2 postorder, and 
.i2 level order
.i1 Often defined recursively
.SS Preorder traversal
.IT A \fIdepth first search\fR
.IT Defined as
.i1s
.mk
.PSPIC -R images/tree1.eps
.rt
Visit all nodes \m[red]before\m[] visiting children
.CW
  void preorder(tree<T>* node) {
    if (node == nullptr) {
      return;
    }
    visit(node);
    preorder(node.left);
    preorder(node.right);
  }
.R
.i1e

.IT Where 'visit' is a general term
.i1 Represents whatever operation you actually need to take
.IT Given the tree on the right
.i1 Preorder traversal is:
.TS
center tab(!);
c|c|c|c|c|c|c|c|c.
A!B!D!C!E!G!F!H!I
.TE
.SS Postorder traversal
.IT A \fIdepth first search\fR
.IT Defined as
.i1s
.mk
.PSPIC -R images/tree1.eps
.rt
Visit all nodes \m[red]after\m[] visiting children
.CW
  void postorder(tree<T>* node) {
    if (node == nullptr) {
      return;
    }
    postorder(node.left);
    postorder(node.right);
    visit(node);
  }
.R
.i1e

.IT Given the tree on the right
.i1 Postorder traversal is:
.TS
center tab(!);
c|c|c|c|c|c|c|c|c.
D!B!G!E!H!I!F!C!A
.TE
.SS Inorder traversal
.IT A \fIdepth first search\fR
.IT Defined as
.i1 Visit \m[red]left child\m[] (including left sub tree)
.i1 Visit node
.i1s
.mk
.PSPIC -R images/tree1.eps
.rt
 Visit \m[red]right child\m[] (including right sub tree)
.CW
  void inorder(tree<T>* node) {
    if (node == nullptr) {
      return;
    }
    inorder(node.left);
    visit(node);
    inorder(node.right);
  }
.R
.i1e

.IT Given the tree on the right
.i1 Inorder traversal is:
.TS
center tab(!);
c|c|c|c|c|c|c|c|c.
B!D!A!G!E!C!H!F!I
.TE
.SS Level order traversal
.IT A \fIbreadth first search\fR
.i1 Visit every node on a level before going to a lower level
.i1s
A temp structure is needed 
.mk
.PSPIC -R images/tree1.eps
.rt

.CW
  void levelorder(tree<T>* node, 
                  queue<tree<T>*> q) {
    if (node != nullptr) {
      q.push(node);
    }
    while (!q.empty()) {
      visit(q.front());
      q.pop();
      levelorder(node.left, q);
      levelorder(node.right, q);
    }
  }
.R
.i1e
.IT Level order traversal is:
.TS
center tab(!);
c|c|c|c|c|c|c|c|c.
A!B!C!D!E!F!G!H!I
.TE
.SS Examples
.IT Print tree elements
.i1s
Stream 1 tree element overloading \*[c]operator <<\*[r]
.CW
  template <class T>
  std::ostream& operator<< (std::ostream& os, 
                            const tree<T>* root) {
    if (root == nullptr) return os << \m[green]"null"\m[];

    if (is_leaf(root)) {
      return os << root->value;
    }

    return os << root->value 
              << \m[green]" ("\m[] << root->left 
              << \m[green]", "\m[] << root->right << \m[green]")\\n"\m[];
  }
.R
.i1e
.bp
.IT Print entire tree
.i1s
with indenting at each level
.CW
  template <class T>
  void print(const tree<T>* root, 
             const std::uint16_t indent) {
    for (int i = 0; i < indent; ++i) {
      std::cout << \m[green]"   "\m[]";    \m[green]// indent\m[]
    }
    if (root == nullptr) {
      std::cout << \m[green]"null"\m[];
      return;
    }

    std::cout << root;

    if (is_leaf(root)) return;
    print (root->left, indent+1);
    print (root->right, indent+1);
  }
.R
.i1e


