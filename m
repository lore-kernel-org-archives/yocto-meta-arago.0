Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 34EB1529C9
	for <meta-arago@arago-project.org>;
	Sat,  7 Sep 2013 13:31:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r87DV7tF021934;
	Sat, 7 Sep 2013 08:31:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r87DV7P3001168;
	Sat, 7 Sep 2013 08:31:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sat, 7 Sep 2013 08:31:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Nick Gart <nick.gart@gmail.com>
Thread-Topic: [meta-arago] psp kernel versions
Thread-Index: AQHOq2UUvkc7dN4FPU+kI+2iABS3epm6Rjqo
Date: Sat, 7 Sep 2013 13:31:07 +0000
Message-ID: <D0EA785F-DC50-417E-A758-229D9E50E246@ti.com>
References: <CADBzu5BXQKZOOx87c430VKzAbWg7xoW8_=rDgwOY_akDWqXJjQ@mail.gmail.com>
In-Reply-To: <CADBzu5BXQKZOOx87c430VKzAbWg7xoW8_=rDgwOY_akDWqXJjQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: psp kernel versions
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
X-List-Received-Date: Sat, 07 Sep 2013 13:31:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I believe linux-ti33x was the kernel used in older Angstrom releases. Since=
 Beaglebone Black ships with a 3.8 kernel from the beagle community I assum=
e that Linux-ti33x doesn't support  Beaglebone Black.

Linux-am335x comes directly from TI and it is the latest supported kernel f=
or companies who want to develop commercial products with am335x. This kern=
el also supports Beaglebone Black.

On Sep 6, 2013, at 7:56 PM, "Nick Gart" <nick.gart@gmail.com> wrote:

> Hi, I can't seem to find this info anywhere so:
> I am looking to get a 3.2 kernel running on beagle bone black.
> What is the difference between the ti33x PSP and the am335x PSP? I see th=
at the ti33x kernel is patched to a higher version of 3.2, but the am335x s=
eems to have better support for the beaglebone black.
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

