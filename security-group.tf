resource "aws_security_group" "k8s_master" {
  name        = "k8s_master_sg"
  description = "k8s_master security group"


  ingress {
    description      = "ssh"
    protocol         = "tcp"
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "etcd"
    protocol         = "tcp"
    from_port        = 2379
    to_port          = 2380
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "API SERVER"
    protocol         = "tcp"
    from_port        = 6443
    to_port          = 6443
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "Weavenet"
    protocol         = "tcp"
    from_port        = 6783
    to_port          = 6783
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "Weavenet udp"
    protocol         = "udp"
    from_port        = 6784
    to_port          = 6784
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "Kubelet API, Kube-scheduler, Kube-controller-manager, Read-Only Kubelet API, Kubelet health"
    protocol         = "tcp"
    from_port        = 10248
    to_port          = 10260
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "NodePort Services"
    protocol         = "tcp"
    from_port        = 30000
    to_port          = 32767
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "k8s_master_sg"
  }
}


resource "aws_security_group" "k8s_worker" {
  name        = "k8s_worker_sg"
  description = "k8s_worker_sg security group"


  ingress {
    description      = "ssh"
    protocol         = "tcp"
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }




  ingress {
    description      = "Weavenet"
    protocol         = "tcp"
    from_port        = 6783
    to_port          = 6783
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "Weavenet udp"
    protocol         = "udp"
    from_port        = 6784
    to_port          = 6784
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "Kubelet API, Kube-scheduler, Kube-controller-manager, Read-Only Kubelet API, Kubelet health"
    protocol         = "tcp"
    from_port        = 10248
    to_port          = 10260
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "NodePort Services"
    protocol         = "tcp"
    from_port        = 30000
    to_port          = 32767
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "k8s_worker_sg"
  }
}