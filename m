Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by arago-project.org (Postfix) with ESMTPS id CEA91529A7
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 07:40:03 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so8605118igb.1
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pBo3j92ObQFMPAo8P6GWSwoO0EYtiFdLrwpUu9oxMYk=;
	b=eIpK425B4Ou9Q+mCRH/i5SUwU1Zw+0nq0zV8LtfuD9tCc8ADCwV/2l/cURVfBZ7Lez
	NlP2kUGOgkssRRmXbScnR2Uixq7HVpROPN57KtHELZz0rxwl2L0oh+eu9xX09hWXlK1i
	WoY9ibCe2YkOl9glAgoUJcv8PETMCVaQotJow3IbQ47uFInkVaHyjZeg8wu2lDHsOg1e
	FiJeArNDONufaNaSophpo8YZTzpdDy+rWsBQhN6kDF1gxt7y63ftnhWLscuoHGaZi9Fb
	T0XxlrzlYE8g3o7Z8HKkY5o/XnAhs42bKibaAlZ2TMWLwcb6uNW5fAmTkylGDuTBi4N7
	7tCA==
MIME-Version: 1.0
X-Received: by 10.43.65.19 with SMTP id xk19mr13979251icb.20.1432885202594;
	Fri, 29 May 2015 00:40:02 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Fri, 29 May 2015 00:40:02 -0700 (PDT)
Date: Fri, 29 May 2015 10:40:02 +0300
Message-ID: <CADnUhn30yG8MMjbonRKZqcpZJaqv6y8LzVXutj__2+Ns2nBq+w@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: install/bitbake error
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
X-List-Received-Date: Fri, 29 May 2015 07:40:04 -0000
Content-Type: multipart/alternative; boundary=14dae9d7c11a813ffc051733954c

--14dae9d7c11a813ffc051733954c
Content-Type: text/plain; charset=UTF-8

I tried to install Arago distribution following
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

I downloaded arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2 and inserted
arago-2011.09/armv7a/bin to my PATH

After some nasty error messages I inserted also TOOLCHAIN_BRAND=arago
definition.
BTW, why that is not mentioned in wiki, nor inserted in local.conf?

Still after that I can't run:
bitbake core-image-minimal
successfully. I have set MAHINE=am335x-evm

OSError: [Errno 13] Permission denied: '/ARAGO-external-arago-toolchain'

Is this something to do with the fact that I chose to run?:

./oe-layertool-setup.sh -f configs/arago-fido-config.txt

This '/ARAGO-external-arago-toolchain' path seems pretty strange.

Does anyone have any clue what I have done wrong?

-Matti

--14dae9d7c11a813ffc051733954c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>I tried to in=
stall Arago distribution following <br><a href=3D"http://arago-project.org/=
wiki/index.php/Setting_Up_Build_Environment">http://arago-project.org/wiki/=
index.php/Setting_Up_Build_Environment</a><br><br></div>I downloaded arago-=
2011.09-armv7a-linux-gnueabi-sdk.tar.bz2 and inserted arago-2011.09/armv7a/=
bin to my PATH<br><br></div>After some nasty error messages I inserted also=
 TOOLCHAIN_BRAND=3Darago definition.<br></div>BTW, why that is not mentione=
d in wiki, nor inserted in local.conf?<br><br></div>Still after that I can&=
#39;t run:<br></div>bitbake core-image-minimal <br></div>successfully. I ha=
ve set MAHINE=3Dam335x-evm<br><br>OSError: [Errno 13] Permission denied: &#=
39;/ARAGO-external-arago-toolchain&#39;<br><br></div>Is this something to d=
o with the fact that I chose to run?:<br><pre>./oe-layertool-setup.sh -f co=
nfigs/arago-fido-config.txt</pre>This &#39;/ARAGO-external-arago-toolchain&=
#39; path seems pretty strange.<br><br></div>Does anyone have any clue what=
 I have done wrong?<br><br></div>-Matti<br><div><div><div><div><br></div></=
div></div></div></div>

--14dae9d7c11a813ffc051733954c--
