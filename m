Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id CC72052A12
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 04:25:50 +0000 (UTC)
Received: by obbfr1 with SMTP id fr1so28612071obb.1
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 21:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=rtXaXmlDeFOkKqfjHJy/2R9kKWWpdZWiBv/rSNInYLE=;
	b=LopXeoBp1tzISlIA6+agtI1KtKIU9nYrgysv+InaVVFDJzWKXXujhIDOzGGUXgNGBE
	EKoNtwPoYPRnN5bjC/GKhfdY53JrHzMUeGNOqQ83+jQp54X87SX1Ep3RYHlhkJ6PnUsi
	0E4pwEIGAPpOAvciuiOscMzhpxQQAqlhxjx2wzS7SGTfopI5osdGcIYZcK+yVRJbw8Mw
	zPOVigXaCU7qNHHRPy0xsrvIDexlaCLRojcWtTXOnjmZaddsIIfwlhQFa/t4CLAu9Qmj
	FBF7WXg/K7i9wti26CnLAwWfKNCiF6hud08sSXQOrw3L2x0UO3SY8hZfiFDJfyIHIMiS
	isUA==
X-Received: by 10.60.44.171 with SMTP id f11mr21312379oem.12.1439439948318;
	Wed, 12 Aug 2015 21:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.131 with HTTP; Wed, 12 Aug 2015 21:25:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 13 Aug 2015 16:25:28 +1200
Message-ID: <CADySD0Fs0k-B0G=ZFa_yesxdF7tuvdjjAkfKdBPp0JpS=5EcVw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Using Valgrind from Yocto doesn't give stack trace
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Aug 2015 04:25:55 -0000
Content-Type: multipart/alternative; boundary=001a11333e9ecb8f29051d29babc

--001a11333e9ecb8f29051d29babc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am using Valgrind coming from yocto on my AM335x-EVM kit.

But when I try to use valgrind, it doesn't give me stack trace. Following
is what I get :

root@am335x-evm:~# valgrind --tool=3Dmemcheck --leak-check=3Dyes
--track-origins=3Dyes --error-limit=3Dno /home/root/test
Checking /home/root/test for memory leaks..
=3D=3D1732=3D=3D Memcheck, a memory error detector
=3D=3D1732=3D=3D Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward e=
t al.
=3D=3D1732=3D=3D Using Valgrind-3.9.0 and LibVEX; rerun with -h for copyrig=
ht info
=3D=3D1732=3D=3D Command: /home/root/test
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D Invalid write of size 4
=3D=3D1732=3D=3D    at 0x8420: main (test.c:11)
=3D=3D1732=3D=3D  Address 0x4823060 is 0 bytes inside a block of size 4 fre=
e'd
=3D=3D1732=3D=3D    at 0x48109C4: free (in
/usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D HEAP SUMMARY:
=3D=3D1732=3D=3D     in use at exit: 4 bytes in 1 blocks
=3D=3D1732=3D=3D   total heap usage: 2 allocs, 1 frees, 8 bytes allocated
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D 4 bytes in 1 blocks are definitely lost in loss record 1 o=
f 1
=3D=3D1732=3D=3D    at 0x4811FE8: malloc (in
/usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D LEAK SUMMARY:
=3D=3D1732=3D=3D    definitely lost: 4 bytes in 1 blocks
=3D=3D1732=3D=3D    indirectly lost: 0 bytes in 0 blocks
=3D=3D1732=3D=3D      possibly lost: 0 bytes in 0 blocks
=3D=3D1732=3D=3D    still reachable: 0 bytes in 0 blocks
=3D=3D1732=3D=3D         suppressed: 0 bytes in 0 blocks
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D For counts of detected and suppressed errors, rerun with: =
-v
=3D=3D1732=3D=3D ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 fro=
m 0)

=E2=80=8BHow to get stack trace ?

thanks
Ankur=E2=80=8B

--001a11333e9ecb8f29051d29babc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">I am using Valgrind coming from yocto on my AM335x-EVM=
 kit.</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;=
font-size:small;color:#333399"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#333399">But when I try=
 to use valgrind, it doesn&#39;t give me stack trace. Following is what I g=
et :</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;f=
ont-size:small;color:#333399"><br></div><div class=3D"gmail_default"><font =
color=3D"#333399" face=3D"georgia, serif">root@am335x-evm:~# valgrind --too=
l=3Dmemcheck --leak-check=3Dyes --track-origins=3Dyes --error-limit=3Dno=C2=
=A0</font><span style=3D"color:rgb(51,51,153);font-family:georgia,serif">/h=
ome/root/test</span><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:georgia,serif;font-size:small;color:#333399"><div class=3D"gmail_defau=
lt">Checking /home/root/test for memory leaks..</div><div class=3D"gmail_de=
fault">=3D=3D1732=3D=3D Memcheck, a memory error detector</div><div class=
=3D"gmail_default">=3D=3D1732=3D=3D Copyright (C) 2002-2013, and GNU GPL&#3=
9;d, by Julian Seward et al.</div><div class=3D"gmail_default">=3D=3D1732=
=3D=3D Using Valgrind-3.9.0 and LibVEX; rerun with -h for copyright info</d=
iv><div class=3D"gmail_default">=3D=3D1732=3D=3D Command: /home/root/test</=
div><div class=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=3D"gmail_=
default">=3D=3D1732=3D=3D Invalid write of size 4</div><div class=3D"gmail_=
default">=3D=3D1732=3D=3D =C2=A0 =C2=A0at 0x8420: main (test.c:11)</div><di=
v class=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0Address 0x4823060 is 0 byt=
es inside a block of size 4 free&#39;d</div><div class=3D"gmail_default">=
=3D=3D1732=3D=3D =C2=A0 =C2=A0at 0x48109C4: free (in /usr/lib/valgrind/vgpr=
eload_memcheck-arm-linux.so)</div><div class=3D"gmail_default">=3D=3D1732=
=3D=3D</div><div class=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=
=3D"gmail_default">=3D=3D1732=3D=3D HEAP SUMMARY:</div><div class=3D"gmail_=
default">=3D=3D1732=3D=3D =C2=A0 =C2=A0 in use at exit: 4 bytes in 1 blocks=
</div><div class=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 total heap usage=
: 2 allocs, 1 frees, 8 bytes allocated</div><div class=3D"gmail_default">=
=3D=3D1732=3D=3D</div><div class=3D"gmail_default">=3D=3D1732=3D=3D 4 bytes=
 in 1 blocks are definitely lost in loss record 1 of 1</div><div class=3D"g=
mail_default">=3D=3D1732=3D=3D =C2=A0 =C2=A0at 0x4811FE8: malloc (in /usr/l=
ib/valgrind/vgpreload_memcheck-arm-linux.so)</div><div class=3D"gmail_defau=
lt">=3D=3D1732=3D=3D</div><div class=3D"gmail_default">=3D=3D1732=3D=3D LEA=
K SUMMARY:</div><div class=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 =C2=A0=
definitely lost: 4 bytes in 1 blocks</div><div class=3D"gmail_default">=3D=
=3D1732=3D=3D =C2=A0 =C2=A0indirectly lost: 0 bytes in 0 blocks</div><div c=
lass=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 =C2=A0 =C2=A0possibly lost: =
0 bytes in 0 blocks</div><div class=3D"gmail_default">=3D=3D1732=3D=3D =C2=
=A0 =C2=A0still reachable: 0 bytes in 0 blocks</div><div class=3D"gmail_def=
ault">=3D=3D1732=3D=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 suppressed: 0 bytes in 0=
 blocks</div><div class=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=
=3D"gmail_default">=3D=3D1732=3D=3D For counts of detected and suppressed e=
rrors, rerun with: -v</div><div class=3D"gmail_default">=3D=3D1732=3D=3D ER=
ROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)</div></div><di=
v><div class=3D"gmail_signature"><div dir=3D"ltr"><br></div><div dir=3D"ltr=
"><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size=
:small;color:rgb(51,51,153)">=E2=80=8BHow to get stack trace ?</div><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;co=
lor:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:georgia,serif;font-size:small;color:rgb(51,51,153)">thanks</div><div c=
lass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;c=
olor:rgb(51,51,153)">Ankur=E2=80=8B</div><br></div></div></div>
</div>

--001a11333e9ecb8f29051d29babc--
