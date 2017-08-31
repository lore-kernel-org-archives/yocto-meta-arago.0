Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 70FBD529EB
	for <meta-arago@arago-project.org>;
	Thu, 31 Aug 2017 19:04:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VJ4GVg007377
	for <meta-arago@arago-project.org>; Thu, 31 Aug 2017 14:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504206256;
	bh=AC8G/DwlenMyLr1+8CP/bMTaPRE+uAFM4YhJYLtaiTw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=aKZMN4hnmX6kenIkZ+ZooFAEglp33x/+ZcEnZUYoI5sFJzKybPmDAKE6N+f17G2/K
	JjJe9nUNnZ5MxPCqOpb3I/pJBvwgQSyI6A7p5txtLuGU/sRUYDO1Xrq1j4jm1R+7fH
	XNpg2skor6tZyQ7RL9p7XdONIgz3YEwfwUUrHChI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VJ4G4s014010
	for <meta-arago@arago-project.org>; Thu, 31 Aug 2017 14:04:16 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 31 Aug 2017 14:04:15 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo
Thread-Index: AQHTIblaDylsZV2NCUSDbzHOnlsw4aKfJ9IA//+sR6A=
Date: Thu, 31 Aug 2017 19:04:15 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC3A0C3@DFLE12.ent.ti.com>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
	<20170831190244.GB8304@edge>
In-Reply-To: <20170831190244.GB8304@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty][PATCH v3 1/7] evse-hmi : add new demo
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
X-List-Received-Date: Thu, 31 Aug 2017 19:04:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys for the feedback.=20

Somehow my git send-email was not letting me send the more than 7 patches i=
n one email, so I had to split the patches in two emails.=20

Regards,
Manisha


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, August 31, 2017 2:03 PM
To: Agrawal, Manisha
Cc: meta-arago@arago-project.org; Stiffler, Jacob
Subject: Re: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo

Thanks. The entire series now looks good. Though your separate patch for ti=
sdk-rootfs-image should have been part of this series as well, somewhere be=
tween patch #6 and #7...

--
Denys


On Wed, Aug 30, 2017 at 12:56:41PM -0500, Manisha Agrawal wrote:
> EVSE stands for electronic vehicle supply station.  This demo is created =
as part
> of TID on EVSE to demonsrate drawing the gui for EVSE application using Q=
T
> QWidget and rendering on LCD panel using  linuxfb QPA.
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.=
bb
>=20
> diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/me=
ta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 00000000..27a58a96
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "HMI demo for electronic vehicle charging station (EVSE) usi=
ng QT QWidget tools"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=3Da=
9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV =3D "1.0"
> +PR =3D "r0"
> +
> +BRANCH =3D "master"
> +SRC_URI =3D "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=3Dgit;b=
ranch=3D${BRANCH}"
> +
> +SRCREV =3D "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}
> --=20
> 2.13.0
>=20

