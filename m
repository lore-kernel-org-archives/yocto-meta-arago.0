Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by arago-project.org (Postfix) with ESMTPS id BA81152092
	for <meta-arago@arago-project.org>;
	Mon, 22 Feb 2016 01:49:28 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id e6so117085406vkh.2
	for <meta-arago@arago-project.org>;
	Sun, 21 Feb 2016 17:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=PPmljmQIpuYacOGZUeKZgsrF25rHXnAHQ+Eysrv+2fA=;
	b=o0dkgphK85Oto5A5aqx+XKIQP4+JHadVoUl2p8T7gT/RyZu6JcsObfY2QU9kAzyM/K
	mLno9ihP0xD03QCDfu6xIr8djw7hD8msQOtEKbTAPq6mVhno2qTVMuwtBzjUrpflTJR8
	xGGQDjo1zr/phcRu9IemesKkoHyIhqOasXk1d2PE69mGtTW1d5632jNT0HI7K0kWCUTM
	Ls5GhfJk9o8UUwg3QiUY4POenfOrebNa8jjr2c3yfsunylDI6w8ivTBE0PC1brjJqe64
	G5Tto5KDhMzAAg1JttMfiGOL9iG/TvhOfHZ//s9BP/Z7LaCfBKoYbiFJJrB0zCo2/fa1
	GnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=PPmljmQIpuYacOGZUeKZgsrF25rHXnAHQ+Eysrv+2fA=;
	b=aUfl4UgR2UXt7ldmvJs/zI4Wynpj8B0WLGq2t2i+l9hPsihmxYqvr4DT7gAMJtsnXR
	/Gy0jYIW0mK72UzlP0t547hl6i8AvkI8Z3kyI353v6fys+ab8klIR6uj7anLRsIw1XO0
	jJ2EBG7y2hy/wdfjAAsDZQdPdq8E3ByPKWXGsQSlTTkiXA7v/esp1EAItCBXF/1tuDQ5
	HvRv9dZ6YhtPNQrTkKbYNJZQHcA0+tT0DlDiYeKKLHB5LlbB8adaG3iHHc85oFfwHalF
	fKIJm3SOFlSszfcxCkuOKxcFEGZXZfAG2A/ShkZxhv6LMdvpF7E3NQmrskow7fyMjTUQ
	EAHQ==
X-Gm-Message-State: AG10YOSDTUvxc7vpb0kNyMzT6wuj9rjoyd8NDkeEuLO1U3pUpNnxPgXy8lvAJK5rPwPJ1KT5uNO467Inv2YyMw==
X-Received: by 10.31.148.144 with SMTP id w138mr19077595vkd.44.1456105768303; 
	Sun, 21 Feb 2016 17:49:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Sun, 21 Feb 2016 17:49:08 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 22 Feb 2016 14:49:08 +1300
Message-ID: <CADySD0FyhAvLh83Gi=qDOmqGVHNZ6eNhjmOC_okpib9+jYysAQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: How to rotate display by 180 degree in am335x ?
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
X-List-Received-Date: Mon, 22 Feb 2016 01:49:28 -0000
Content-Type: multipart/alternative; boundary=001a11408c44134228052c520ba6

--001a11408c44134228052c520ba6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am running arago distro (daisy) on am335x-evm based reference board.

How can I rotate the display by 180 degree ?

Here is the configuration:
- Linux version 3.14.49-ge9cd4cc
 - drm 1.1.0 20060810
- SGX_DDK_Linux_CustomerTI sgxddk 1.10@2359475

When I run following command, no rotation happens
echo 2 > /sys/class/graphics/fb0/rotate

thanks
Ankur=E2=80=8B

--001a11408c44134228052c520ba6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(51,51,153)=
;font-family:georgia,serif;font-size:small"><br></div><p>Hi,<br><br>I am ru=
nning arago distro (daisy) on am335x-evm based reference board.<br><br>How =
can I rotate the display by 180 degree ?<br><br>Here is the configuration:<=
br>- Linux version 3.14.49-ge9cd4cc<br>=C2=A0- drm 1.1.0 20060810<br>- SGX_=
DDK_Linux_CustomerTI sgxddk 1.10@2359475<br><br>When I run following comman=
d, no rotation happens<br>echo 2 &gt; /sys/class/graphics/fb0/rotate</p><di=
v><br>thanks<br>Ankur=E2=80=8B</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(51,51,153);font-family:georgia,serif;font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"color:rgb(51,51,153);font-family:georgi=
a,serif;font-size:small"><br></div></div>

--001a11408c44134228052c520ba6--
