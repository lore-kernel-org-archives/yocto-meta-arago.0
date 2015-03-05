Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D723652A62
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 19:59:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25JxGLN028129
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:59:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25JxFHn005882
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:59:15 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 13:59:14 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: process
Thread-Index: AdBXe4Q+lAQvqIrgSq6vcEPWSYCrmAANVL2AAAyCAOA=
Date: Thu, 5 Mar 2015 19:59:14 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410572F@DFLE09.ent.ti.com>
References: <4B26FB5A64EBA14C87266869E037F958141056F9@DFLE09.ent.ti.com>
	<20150305195702.GY6052@edge>
In-Reply-To: <20150305195702.GY6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: process
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
X-List-Received-Date: Thu, 05 Mar 2015 19:59:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, just the name.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 05, 2015 2:57 PM
To: Stiffler, Jacob
Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
Subject: Re: process

Can we avoid creating another image recipe? Why do we need a separate amsdk=
 image in the first place? Just the name?


On Thu, Mar 05, 2015 at 02:38:26PM -0500, Stiffler, Jacob wrote:
>    Denys, Franklin,
>=20
>    =20
>=20
>    Soon, I am going to be submitting a patch to a the
>    `processor-sdk-linux-image' image. This will be based off of the
>    `arago-amsdk-image'.
>=20
>    =20
>=20
>    One question I have, as I am not aware of the history, is for the
>    following line:
>=20
>    =20
>=20
>    DEPLOY_SPL_NAME_omapl138 =3D ""
>=20
>    =20
>=20
>    =20
>=20
>    Would there be any reason for me to retain this in the
>    processor-sdk-linux-image?
>=20
>    =20
>=20
>    Thank you,
>=20
>    Jake

