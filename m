Return-Path: <kiran.bobbu@gmail.com>
Received: from mail-oa0-f68.google.com (mail-oa0-f68.google.com
	[209.85.219.68])
	by arago-project.org (Postfix) with ESMTPS id 3051D529DC
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2013 10:45:59 +0000 (UTC)
Received: by mail-oa0-f68.google.com with SMTP id j6so2021197oag.11
	for <meta-arago@arago-project.org>;
	Fri, 09 Aug 2013 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=E1VWBz56bIYgXTo1qLNEMUsbHQEEt3jobA/Q93m5mqU=;
	b=0SytLEw0WoJklr+dZwGsqyuS+zhX2i6nA1y17shcuS6pjb7wfojO803TlkzA/owJYK
	DMZ4sUKj5Jnv37EvqEyTa1z9P9/3LWK4iCOmJDhHZ6X/AFUWh95KN+nrnMEY9jpaGyMP
	1pl6k9HfN3wDXC95/gr9MMrPZkb525pwJTIoNcQoOriAliiu6Wp2q8Mdde+5JfLtFcxq
	uiqZ1H7h6cc9RRAPIXkx1QlNAx+vw47KKnW6dwaMEgZ0knWS5CuSDCPe1pIlnR1yVtTD
	PZOV+W0QDwpVeubGbakSWG3aif30cTUZq8+XoVTOMadBQf+T2kLdLY0bj8PXXB3IebNS
	fIhg==
MIME-Version: 1.0
X-Received: by 10.182.237.50 with SMTP id uz18mr13048obc.37.1376045158412;
	Fri, 09 Aug 2013 03:45:58 -0700 (PDT)
Received: by 10.182.14.42 with HTTP; Fri, 9 Aug 2013 03:45:58 -0700 (PDT)
Date: Fri, 9 Aug 2013 16:15:58 +0530
Message-ID: <CAO7jpqfv_WvnpmEcbH5rZQ3qOGp2SW1Vq4=z=xpHVZuBDBhg=w@mail.gmail.com>
From: kiran bobbu <kiran.bobbu@gmail.com>
To: meta-arago@arago-project.org
Subject: whats the bitbake target to build X11 for omap5 evm
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
X-List-Received-Date: Fri, 09 Aug 2013 10:45:59 -0000
Content-Type: multipart/alternative; boundary=e89a8ff2511cdcb89c04e3817a76

--e89a8ff2511cdcb89c04e3817a76
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I want to build x11 as a part of arago distribution  .but its failing with
error
ERROR: Nothing PROVIDES 'xf86-video-omap_git'


build command used:
MACHINE=omap5-evm bitbake xf86-video-omap_git


How to resolve this.

-Kiran

--e89a8ff2511cdcb89c04e3817a76
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><br clear=3D"all"><br></div>Hi,<br></div>I =
want to build x11 as a part of arago distribution=A0 .but its failing with =
error <br>ERROR: Nothing PROVIDES &#39;xf86-video-omap_git&#39;<br><br><br>=
build command used:<br>
MACHINE=3Domap5-evm bitbake xf86-video-omap_git<br><br><br></div>How to res=
olve this.<br><div><div><div><br>-Kiran<br>
</div></div></div></div>

--e89a8ff2511cdcb89c04e3817a76--
