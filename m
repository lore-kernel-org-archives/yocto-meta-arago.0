Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by arago-project.org (Postfix) with ESMTPS id 5576552974
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 09:10:26 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id e185so92583182vkb.1
	for <meta-arago@arago-project.org>;
	Tue, 02 Feb 2016 01:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=I/IBKwAUvqZMRNZ1MKNU117ak+tSwRBfXSp+RFbtdZQ=;
	b=UAanqv71krL9v+YnKc23sPg/WQaJr+vKxyT6MeF6rWYgp0kP6TCDg/R8f8qlLeCzTr
	CiRNtu69L0vE8j79rRLwMkRWhB83WTewtwGloebgLsJCzpLtPsYicoha4nCFvcpsOjXj
	+HskoCJFk6cBNP+qzviAYsifk2DY2kxGmV7XNhkkWKo5LarliY/tNXmTa5au69jefctJ
	ANaYhjyAU5dqaaL0HAB8FReNMAkyQdvx49rssqf3kg/SqNtqaKC9dx2GNpY5IaOtJ2W5
	zUjPL2ZiGLLIXl5xlx2Iyc0V7iN/XSs/sTsHNReI6JXN0/D22UxR+ppXkcyEkbJDEDMl
	BsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=I/IBKwAUvqZMRNZ1MKNU117ak+tSwRBfXSp+RFbtdZQ=;
	b=Rlt5kiWgk2M9bMe2YKhaHe8QeZEmgcAAOIPY9OLw9LyQEv8sRA18OUK9lGkwgSmv2g
	a50OAk+i+l0KEOM6S4B1MlDEGDGqlJq46OK46MeQBgvu0dyNniuEPh1fVo+OwGPAEQlb
	u+qGFFTTdGSA05gyprcE367FG0fdvF1Bt06EEujnCCPgR7ZXTq7zkHt5gDE5hnWGic7L
	3S5OXRxmecOTJRJe0pYTAxaJaL8B6lKoozCRV0mV1uxyTMtHaRVTQVORnFkzno4bAmKT
	+M04QP9gKuV7mfBPO/zc6jVwfWS/P0kHMFOKzG5KJA2cNiRdetRiMqXs6SUiUPcsB9d4
	NgaA==
X-Gm-Message-State: AG10YOTw6bxKSmau5w6sjvs1o2JGPC8ESjMwuKXz2c7SpX8Ngbhp9OzRy5Nin6EVId9ijRohX38gGXpS2Edy6w==
X-Received: by 10.31.148.144 with SMTP id w138mr17576948vkd.44.1454404225736; 
	Tue, 02 Feb 2016 01:10:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Tue, 2 Feb 2016 01:10:06 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Feb 2016 22:10:06 +1300
Message-ID: <CADySD0HXCNyRq3_cHJpO2WQWGnVCd9rNS-B1g09vAUN5cKMdrw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Graphics binary for AM335x-EVM in fido
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
X-List-Received-Date: Tue, 02 Feb 2016 09:10:26 -0000
Content-Type: multipart/alternative; boundary=001a11408c443c2480052ac5df14

--001a11408c443c2480052ac5df14
Content-Type: text/plain; charset=UTF-8

Hi,

For AM335x-EVM, with arago-daisy config, libgles-omap3 was used.

Whereas in arago-fido config,  libgbm, omap5-sgx-ddk-um-linux and
omapdrm-pvr are used.

I would like to know the advantage of this change.

Because of this new change, my QT5 application which was working with daisy
branch is crashing on fido.

Is it okay if I roll back to libgles-omap3 for am335x-evm on fido ?

thanks
Ankur

--001a11408c443c2480052ac5df14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>For AM335x-EVM, with arago-daisy config, libgle=
s-omap3 was used.<br><br>Whereas in arago-fido config, =C2=A0libgbm, omap5-=
sgx-ddk-um-linux and omapdrm-pvr are used.<br><br>I would like to know the =
advantage of this change. <br><br>Because of this new change, my QT5 applic=
ation which was working with daisy branch is crashing on fido.<br><br>Is it=
 okay if I roll back to libgles-omap3 for am335x-evm on fido ?<br><br>thank=
s<br>Ankur</div>

--001a11408c443c2480052ac5df14--
