Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1F214529EF
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2012 06:25:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA86PvvH003035
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2012 00:25:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA86PvNR022125
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2012 00:25:57 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 8 Nov 2012 00:25:57 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] meta-toolchain-arago: move LD_LIBRARY_PATH
	setting into each shell stub [issue]
Thread-Index: Ac29XL9r7FdJOoPAQCq8P1ndHtAB8QAQRJSAAAle4wA=
Date: Thu, 8 Nov 2012 06:25:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31B146@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C31AF50@DFLE09.ent.ti.com>
	<20121108044258.GA14870@edge>
In-Reply-To: <20121108044258.GA14870@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-toolchain-arago: move LD_LIBRARY_PATH setting into each shell stub [issue]
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
X-List-Received-Date: Thu, 08 Nov 2012 06:25:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Success! I just need to test building these applications via Qt Creator and=
 Code Composer Studio but building from the command line works without a pr=
oblem!

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, November 07, 2012 10:43 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] meta-toolchain-arago: move LD_LIBRARY_PATH settin=
g into each shell stub [issue]

Ok, so the good news is that all the SDK binaries are working fine.

Now, as of the C++ headers, I'm surprised it used to work like that in prev=
ious SDKs, but I see that the headers are installed in the wrong place, not=
 where toolchain expects them to find:

/linux-devkit/arm-arago-linux-gnueabi/usr/include/c++/4.5.3

And they should be:

/linux-devkit/arm-arago-linux-gnueabi/include/c++/4.5.3

Fixed now.

Denys


On Thu, Nov 08, 2012 at 03:06:52AM +0000, Cooper Jr., Franklin wrote:
> Some more progress being made. Building non Qt applications working=20
> again and qmake works. But make is having issues finding include files
>=20
> /home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/li
> nux-devkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtCore/qglobal.h:68=
:21: fatal error: algorithm: No such file or directory compilation terminat=
ed.
> make: *** [main.o] Error 1
>=20
> That header is apart of the C++ standard library and is located at=20
> /home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/li
> nux-devkit/arm-arago-linux-gnueabi/usr/include/c++/4.5.3
>=20
> I am currently fiddling with mkspecs, linux.conf and QMAKE_INCDIR with no=
 luck.
>=20
> Complete log: pastebin.com/xRh4tWik
>=20
>=20
> Regards,
> Franklin Cooper Jr.
> Texas Instruments
> Application Engineer
> fcooper@ti.com<mailto:fcooper@ti.com>
>=20

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


