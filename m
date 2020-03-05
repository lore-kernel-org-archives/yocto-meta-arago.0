Return-Path: <memarnejadm74@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by arago-project.org (Postfix) with ESMTPS id 418CE529F7
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 10:21:39 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id x194so1481839vsc.12
	for <meta-arago@arago-project.org>;
	Thu, 05 Mar 2020 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=WZeMZZtcWkO29DVCC6dY95fFJb4RvrgW/fklyDroEgQ=;
	b=PmWxwFhHcHuXOHr5VjbybZ/ABnk8b6BZSKD+V9JdobrhcFvR6Uzu6TPRjmzFxthTud
	rFoNA6WeX9xVl7p3GEUQT0ZKtcXDapkwqYxc5+uH2fp4G2MA5jQcAOHQG1FTvQpD4YIG
	xoTm19Ztx0XVl+13J9s2a9gyQA0QlHUpPdx6MJkoZbdWFFTlOjaeCaS7EWF2XwsQucja
	q2OXUa+/p2slwk91bsI0yOfXKF5vH95wDd4s7kuimLfLsDaBdF0FjG0EddzZTgq/0Kzl
	Dv0+cAOb7Q4D17JLgX1+rag3tE1ysaAY+UH5n0SNSQq10Q/P79ZA9Psoirb29gtUL39d
	SI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WZeMZZtcWkO29DVCC6dY95fFJb4RvrgW/fklyDroEgQ=;
	b=e1jX843lY5vjwMM6qpY2w0iLBLChu/pW8mzG8wKPB4G8CMhQ9wgFMarDSjtec68XFp
	Padivr4fjG3nJ8jUf/xJ+Hgvkk5cILLyB/2/RceddgclnXddWN++9BWq79kTTP+6SPUb
	ZedCOERBb7upGXv8JPDktuEd5+AkeeGT0/Yr650ApOO/t6THJ0Y1H3RCTiOcSjHWbLlR
	O7eCizAnfTwRKXvoJtR31dMrs35U+2OUZFvV88rxJ9Uf+byWb2V+I+G2eiyfC8bX4dwr
	MzaRlbsMuUsc9H5Lk/zeh12pLQRTxwWhZqs8gwv+7sIUJleYyediPCWo00lHnA2DSMHy
	7GWQ==
X-Gm-Message-State: ANhLgQ114MwpjPDE5MpN6b/zhlAYD50J2qt2YD2Iab/YQc7tzW/zctzI
	s1sWutbzTNhT4quDcrXnsgFjxYcBXmjWM07VxVhOvLbpZGY=
X-Google-Smtp-Source: ADFU+vs977oNKAabjCrJ3zCGHGRexET0lQfr//xXjSZUv94svVwDBc3+oY0YoS7610MfOpXeltaP2HqN9221mY+HuqQ=
X-Received: by 2002:a67:ed0a:: with SMTP id l10mr4513557vsp.239.1583403575617; 
	Thu, 05 Mar 2020 02:19:35 -0800 (PST)
MIME-Version: 1.0
From: Mehran Memarnejad <memarnejadm74@gmail.com>
Date: Thu, 5 Mar 2020 13:49:24 +0330
Message-ID: <CAER1B8+sg_eSveXBjjvSg-aF4xRNMt9-a6U7RuOhfYpwjTk_Aw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Using Toaster with Arago
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
X-List-Received-Date: Thu, 05 Mar 2020 10:21:39 -0000
Content-Type: multipart/alternative; boundary="000000000000a92ea405a018df06"

--000000000000a92ea405a018df06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
"This is a little unrelated to meta-arago layer, But related to Arago
distro by Ti and I guessed you might be able to help me with"

All explanations about toaster I found on Internet are based on Poky, i.e.
they say "source oe-init-build-env" and then "source bitbake/bin/toaster
start", I could run this successfully, But now I want to do it in my own
way with a little modification of Arago directory structure.
What I want is that to do things from scratch. By scratch I mean:
1- Cloning bitbake which contains toaster as well ... (NOT cloning poky or
arago which also contain bitbake)
2- Put all arago and my layers in a directory named layers
3- Source a script to initialize enviornment (here I use setenv ... put a
few lines ahead)
4- Source bitbake/bin/toaster start
5- Go to localhost:8000 and create a new project
6- Add all my required layers to project
7- And finally, building my target recipe such as arago-core-tisdk-bundle

*Here is the structure of directory I want to have: tree -L 2
~/Desktop/scratch*
.
=E2=94=9C=E2=94=80=E2=94=80 bitbake
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 AUTHORS
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bin
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ChangeLog
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 classes
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 conf
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 contrib
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 doc
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 lib
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE.GPL-2.0-only
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE.MIT
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 MANIFEST.in
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 README
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 toaster-requirements.txt
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 TODO
=E2=94=9C=E2=94=80=E2=94=80 layers
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-mylayer
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-arago
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-aws
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-browser
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-linaro
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-openembedded
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-processor-sdk
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-qt5
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-ros
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-ti
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-virtualization
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 oe-core
=E2=94=94=E2=94=80=E2=94=80 setenv


*setenv file is from Arago project from TI that contains ... I modified it
a little (my modifications is in Bold):*

# Set OEBASE to where the build and source directories reside
# NOTE: Do NOT place a trailing / on the end of OEBASE.
export OEBASE=3D*/home/akbar/Desktop/scratch*

# try to find out bitbake directory
BITBAKEDIR=3D`find *${OEBASE}* -name "*bitbake*"`
for f in ${BITBAKEDIR}
do
    if [ -d ${f}/bin ]
    then
        PATH=3D"${f}/bin:$PATH"
    fi
done

# check for any scripts directories in the top-level of the repos and add
those
# to the PATH
SCRIPTS=3D`find *${OEBASE}/layers* -maxdepth 2 -name "scripts" -type d`
for s in ${SCRIPTS}
do
    PATH=3D"${s}:$PATH"
done

unset BITBAKEDIR
unset SCRIPTS
export PATH
export BUILDDIR=3D${OEBASE}/build
export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_pro=
xy
https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE
GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE
META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH
TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8
EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE
ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT
TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"

*Result:*
When I "source bitbake/bin/toaster start", toaster runs on localhost:8000.
Then I can create a project and add my layers (local on my PC) (toaster
shows recipes in layers), but I can't build my recipe.. It gives me an
error.. when it starts, It says "0% cloning <layer>" and then throws an
error with below description, even though all my layers are local NOT on
git hosting servers:
               command: git fetch && git reset --hard "origin/N/A"
               b"fatal: ambiguous argument 'origin/N/A': unknown revision
or path not in the working tree.\nUse '--' to separate paths from
revisions, like this:\n'git <command> [<revision>...] -- [<file>...]'\n"

The way I add layers to toaster project is:

1-Go to import layer

2-Select local layer and enter path to layer such as
/home/akbar/Desktop/scratch/layers/meta-ti

3-Click on add layer

<my layer addition is somehow like bblayer.conf paths)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Even the default configurations throws the same error. These are the steps
I took:
1- ./oe-layertool-setup.sh -f
configs/processor-sdk/processor-sdk-06.02.00.81-config.txt

2- export
TOOLCHAIN_PATH_ARMV7=3D/home/arad/Desktop/tisdk/toolchain/gcc-arm-8.3-2019.=
03-x86_64-arm-linux-gnueabihf

3- export
TOOLCHAIN_PATH_ARMV8=3D/home/arad/Desktop/tisdk/toolchain/gcc-arm-8.3-2019.=
03-x86_64-aarch64-linux-gnu

4- cd build && source conf/setenv

5- MACHINE=3Dam335x-evm bitbake arago-core-tisdk-bundle (*this works*)

6- source ../source/bitbake/bin/toaster start

7-Create project and add all layers in source directory (as local layer
i.e. their local path on file system) to project and setting machine as
am335x-evm and distro as arago

8- Trying to build arago-core-tisdk-bundle, it gives the same error:

command: git fetch && git reset --hard "origin/N/A"
 b"fatal: ambiguous argument 'origin/N/A': unknown revision or path not in
the working tree.\nUse '--' to separate paths from revisions, like
this:\n'git <command> [<revision>...] -- [<file>...]'\n"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Any help on how to use toaster with arago  is appreciated
Thanks in advance

--000000000000a92ea405a018df06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Hi,<br>&quot;This is a little unrelate=
d to meta-arago=20
layer, But related to Arago distro by Ti and I guessed you might be able
 to help me with&quot;<br></p><p>All explanations about toaster I found on =
Internet are=20
based on Poky, i.e. they say &quot;source oe-init-build-env&quot; and then =
&quot;source
 bitbake/bin/toaster start&quot;, I could run this successfully, But now I=
=20
want to do it in my own way with a little modification of Arago=20
directory structure.<br>What I want is that to do things from scratch. By s=
cratch I mean:<br>1- Cloning bitbake which contains toaster as well ... (NO=
T cloning poky or arago which also contain bitbake)<br>2- Put all arago and=
 my layers in a directory named layers<br>3- Source a script to initialize =
enviornment (here I use setenv ... put a few lines ahead)<br>4- Source bitb=
ake/bin/toaster start<br>5- Go to localhost:8000 and create a new project<b=
r>6- Add all my required layers to project<br>7- And finally, building my t=
arget recipe such as arago-core-tisdk-bundle<br><br><strong>Here is the str=
ucture of directory I want to have: tree -L 2 ~/Desktop/scratch</strong><br=
>.<br>=E2=94=9C=E2=94=80=E2=94=80 bitbake<br>=E2=94=82=C2=A0=C2=A0 =E2=94=
=9C=E2=94=80=E2=94=80 AUTHORS<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 bin<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ChangeLo=
g<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 classes<br>=E2=94=82=
=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 conf<br>=E2=94=82=C2=A0=C2=A0 =E2=
=94=9C=E2=94=80=E2=94=80 contrib<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 doc<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 lib<b=
r>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 LICENSE<br>=E2=94=82=C2=
=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 LICENSE.GPL-2.0-only<br>=E2=94=82=C2=
=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 LICENSE.MIT<br>=E2=94=82=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 MANIFEST.in<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=
=E2=94=80=E2=94=80 README<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 toaster-requirements.txt<br>=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 TODO<br>=E2=94=9C=E2=94=80=E2=94=80 layers<br>=E2=94=82=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 meta-mylayer<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=
=E2=94=80=E2=94=80 meta-arago<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 meta-aws<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 met=
a-browser<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-linaro<=
br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-openembedded<br>=
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-processor-sdk<br>=E2=
=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-qt5<br>=E2=94=82=C2=A0=
=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-ros<br>=E2=94=82=C2=A0=C2=A0 =E2=94=
=9C=E2=94=80=E2=94=80 meta-ti<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 meta-virtualization<br>=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 oe-core<br>=E2=94=94=E2=94=80=E2=94=80 setenv<br><br><br><strong>=
setenv file is from Arago project from TI that contains ... I modified it a=
 little (my modifications is in Bold):</strong><br><br># Set OEBASE to wher=
e the build and source directories reside<br># NOTE: Do NOT place a trailin=
g / on the end of OEBASE.<br>export OEBASE=3D<strong>/home/akbar/Desktop/sc=
ratch</strong><br><br># try to find out bitbake directory<br>BITBAKEDIR=3D`=
find <strong>${OEBASE}</strong> -name &quot;*bitbake*&quot;`<br>for f in ${=
BITBAKEDIR}<br>do<br>=C2=A0=C2=A0=C2=A0 if [ -d ${f}/bin ]<br>=C2=A0=C2=A0=
=C2=A0 then<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PATH=3D&quot;${f}=
/bin:$PATH&quot;<br>=C2=A0=C2=A0=C2=A0 fi<br>done<br><br># check for any sc=
ripts directories in the top-level of the repos and add those<br># to the P=
ATH<br>SCRIPTS=3D`find <strong>${OEBASE}/layers</strong> -maxdepth 2 -name =
&quot;scripts&quot; -type d`<br>for s in ${SCRIPTS}<br>do<br>=C2=A0=C2=A0=
=C2=A0 PATH=3D&quot;${s}:$PATH&quot;<br>done<br><br>unset BITBAKEDIR<br>uns=
et SCRIPTS<br>export PATH<br>export BUILDDIR=3D${OEBASE}/build<br>export
 BB_ENV_EXTRAWHITE=3D&quot;MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_prox=
y=20
https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK=20
BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE=20
GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE=20
META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE=20
TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7=20
TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND=20
ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX=20
TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3=20
ARAGO_SYSVINIT SYSFW_FILE&quot;<br><br><strong>Result:</strong><br>When I=
=20
&quot;source bitbake/bin/toaster start&quot;, toaster runs on localhost:800=
0. Then
 I can create a project and add my layers (local on my PC) (toaster=20
shows recipes in layers), but I can&#39;t build my recipe.. It gives me an=
=20
error.. when it starts, It says &quot;0% cloning &lt;layer&gt;&quot; and th=
en=20
throws an error with below description, even though all my layers are=20
local NOT on git hosting servers:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 command: git fetch &amp;&a=
mp; git reset --hard &quot;origin/N/A&quot; <br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 b&quot;fatal: ambiguous argument &#39;origin/N/A&#39;: unknown revision or=
 path not=20
in the working tree.\nUse &#39;--&#39; to separate paths from revisions, li=
ke=20
this:\n&#39;git &lt;command&gt; [&lt;revision&gt;...] --=20
[&lt;file&gt;...]&#39;\n&quot;</p>
<p>The way I add layers to toaster project is:</p>
<p>1-Go to import layer</p>
<p>2-Select local layer and enter path to layer such as /home/akbar/Desktop=
/scratch/layers/meta-ti</p>
<p>3-Click on add layer</p>
<p>&lt;my layer addition is somehow like bblayer.conf paths)</p>

<p>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</p>
<p>Even the default configurations throws the same error. These are the ste=
ps I took:<br>1- ./oe-layertool-setup.sh -f configs/processor-sdk/processor=
-sdk-06.02.00.81-config.txt</p>
<p>2- export TOOLCHAIN_PATH_ARMV7=3D/home/arad/Desktop/tisdk/toolchain/gcc-=
arm-8.3-2019.03-x86_64-arm-linux-gnueabihf</p>
<p>3- export TOOLCHAIN_PATH_ARMV8=3D/home/arad/Desktop/tisdk/toolchain/gcc-=
arm-8.3-2019.03-x86_64-aarch64-linux-gnu</p>
<p>4- cd build &amp;&amp; source conf/setenv</p>
<p>5- MACHINE=3Dam335x-evm bitbake arago-core-tisdk-bundle (<strong>this wo=
rks</strong>)</p>
<p>6- source ../source/bitbake/bin/toaster start</p>
<p>7-Create project and add all layers in source directory (as local=20
layer i.e. their local path on file system) to project and setting=20
machine as am335x-evm and distro as arago</p>
<p>8- Trying to build arago-core-tisdk-bundle, it gives the same error:</p>
<p style=3D"margin-left:60px">command: git fetch &amp;&amp; git reset --har=
d &quot;origin/N/A&quot; <br>=C2=A0b&quot;fatal:
 ambiguous argument &#39;origin/N/A&#39;: unknown revision or path not in t=
he=20
working tree.\nUse &#39;--&#39; to separate paths from revisions, like=20
this:\n&#39;git &lt;command&gt; [&lt;revision&gt;...] --=20
[&lt;file&gt;...]&#39;\n&quot;</p>
<p>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>Any help on how to use toaster with arago=C2=A0 is appreciated<br>Thanks i=
n advance</p></div></div>

--000000000000a92ea405a018df06--
