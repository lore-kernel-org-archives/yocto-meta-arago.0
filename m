Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by arago-project.org (Postfix) with ESMTPS id 7DFE452A9C
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 21:58:00 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u201so132996352oie.0
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=6qpZF4rT+firv0tCx/7Qph3A4iivMFme8Z9cvKHxDso=;
	b=Q8HQibZob2drM0G/mTkG/0rHq4rMM2kWjjQfMhw8wJEbmTwn3ol9rwzqh3y1aZLwUD
	bZuuD+VPvXC1J8mNY2OF/ww0H1P7kuNBwF4PmvOp+OCJCMPxr6BBfN+TrBvCiAJS5kSA
	MCirIMaKDkxrRNyYcw0c8jbjRp0DwEKytNupOLmC2GMgwTtYKwUtTyB2YA5Cs3f2Fwxt
	ugOG8gElbuPqLo6FS+crQmDuzeZNs0frw/yrh0QXJUIGDKZlUz93DGhfVhy/D6P9R9Gy
	ClQGNydD3FsJHfVY7THHCJE3bXeYA5bY9YtsEDs2Qs9Cvw0LcfQ1qk/LefaWAAq4WZ6O
	o7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6qpZF4rT+firv0tCx/7Qph3A4iivMFme8Z9cvKHxDso=;
	b=bcCsJ1XzdBELqLshpnjeeU2cFhWl5mcXlxsEGvby3jgeBi6NUUk/uDg99WiSZyvR/x
	9yzBwvsSLUVwvnGbJtq7lnsUeresPBTnBpyfosoYfUGkg/o83HfS7P5GeBNAqjSgIAB5
	XgJIKg83P/6sR6bS8u9EEt1B7mQpYSrF6AUVzCq2HaG540TLsmb8Wub+Rn5kwWmow00Y
	4xE8/lLyKyyd+L0pZ75S8ugDiP0KY3v2xDJE/gELsKIAU6jTPmATsHlBOtyAvtdarg4Z
	rK/GTcqNx3hG1g6nBlfGtmuJXGrycYVyzqLd93c4AxdKP7mMQi0LnVLUxiRrCRmf3l3/
	lMCA==
X-Gm-Message-State: ALyK8tKM7gys8/zsSqx2fMbeEYHQcpw5sJTrlqLCupoLGL4Wge5gZIVHjKUaZPShEepHKabStT+AnZxrOJek3A==
X-Received: by 10.202.223.132 with SMTP id w126mr4298910oig.20.1466805480149; 
	Fri, 24 Jun 2016 14:58:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.80.80 with HTTP; Fri, 24 Jun 2016 14:57:40 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 25 Jun 2016 09:57:40 +1200
Message-ID: <CADySD0EGJ7JMswXzHbMGDQeGCHB0yrqq+zNfaS+ck1TzXD4KPw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: ncurses-native compile error when building daisy branch on Ubuntu 16.04 64bit host
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
X-List-Received-Date: Fri, 24 Jun 2016 21:58:00 -0000
Content-Type: multipart/alternative; boundary=001a113d40be9970a005360d4397

--001a113d40be9970a005360d4397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build arago daisy branch on Ubuntu 16.04 64bit host machine
and I am getting this error:

http://pastebin.com/pRaEr2Te

Following is my build configuration
=E2=80=8B:
=E2=80=8B

Toolchain: gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux
(I have installed libstdc++6:i386 libncurses5:i386 libz1:i386 libc6:i386
libc6-dev-i386)

Build Configuration:
BB_VERSION        =3D "1.26.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-16.04"
TARGET_SYS        =3D "arm-linux-gnueabi"
MACHINE           =3D "am335x-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2015.05"
TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-ggl          =3D "master:9dbc979b22a14ddadc6359168420d369f5036225"
meta-arago-distro
meta-arago-extras =3D "daisy:f8c775ae64a26eb1182d515b2beb3544572bd799"
meta-qt5          =3D "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
toolchain-layer
meta-networking
meta-ruby
meta-oe           =3D "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
meta-ti           =3D "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
meta-linaro-toolchain =3D "daisy:dbe0db0a1a5c015feb84ef689f48421594cb0b51"
meta              =3D "daisy:a4e80e831cd13e6418af0d770c5dbd5b9270eaa5"

Is there a patch that fixes this problem ?

thanks
Ankur

--001a113d40be9970a005360d4397
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I am trying to build arago daisy branch on Ubun=
tu 16.04 64bit host machine and I am getting this error:<br><br><a href=3D"=
http://pastebin.com/pRaEr2Te">http://pastebin.com/pRaEr2Te</a><br><br>Follo=
wing is my build configuration<div class=3D"gmail_default" style=3D"font-fa=
mily:georgia,serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=
=80=8B:<br>=E2=80=8B</div><br>Toolchain: gcc-linaro-arm-linux-gnueabihf-4.7=
-2013.03-20130313_linux<br>(I have installed libstdc++6:i386 libncurses5:i3=
86 libz1:i386 libc6:i386 libc6-dev-i386)<br><br>Build Configuration:<br>BB_=
VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;<br>BUILD_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING =
=C2=A0 =3D &quot;Ubuntu-16.04&quot;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;arm-linux-gnueabi&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D &quot;am335x-evm&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;arago&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot=
;2015.05&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;armv7a vfp thumb ne=
on callconvention-hard cortexa8&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;vfp-neon&quot;<br>meta-ggl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;master:9dbc979b22a14ddadc6359168420d369f5036225&quot;<br>meta-=
arago-distro<br>meta-arago-extras =3D &quot;daisy:f8c775ae64a26eb1182d515b2=
beb3544572bd799&quot;<br>meta-qt5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &qu=
ot;krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75&quot;<br>toolchain-laye=
r =C2=A0<br>meta-networking =C2=A0<br>meta-ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0=
<br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:d3d14d3fcca7=
fcde362cf0b31411dc4eea6d20aa&quot;<br>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;daisy:090b02a104924886afd0fa79be7b5d08eebf071f&quot;<br>me=
ta-linaro-toolchain =3D &quot;daisy:dbe0db0a1a5c015feb84ef689f48421594cb0b5=
1&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;d=
aisy:a4e80e831cd13e6418af0d770c5dbd5b9270eaa5&quot;<br><br>Is there a patch=
 that fixes this problem ?<br><br>thanks<br>Ankur</div>

--001a113d40be9970a005360d4397--
