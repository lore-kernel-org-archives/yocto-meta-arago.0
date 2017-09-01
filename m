Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 56DE352978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:09:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81K9Jxe018122
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504296559;
	bh=JeDG4TW9pymXSvPmCTRarn8v4FDvwxavD8E94SEzIs0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=nBKsLQEh5uUJi+ZkBcKtvfy4es0WBLChh9nhi9shrEH6UjFkk46PGxgzIaga4uuUn
	n2dJMI0h6RbVSGPDDY8WqkxlHAfKwmqkplaWSLhXU5oU50U0ijtI4MTz0vib2G2Zin
	PjWBSp2S5uheYNtFxjDgPosfsvC5HaZJmJ5VwbDk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81K9JUN020522
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:09:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 15:09:18 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] weston:
	add   SoC performance monitor utilities
Thread-Index: AQHTIQRB8vwQSnCJkUaBPqkPFYMQ1qKgelTg
Date: Fri, 1 Sep 2017 20:09:18 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825436DDD@DFLE09.ent.ti.com>
References: <1504038000-53588-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1504038000-53588-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] weston: add SoC performance monitor utilities
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
X-List-Received-Date: Fri, 01 Sep 2017 20:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Tuesday, August 29, 2017 4:20 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] weston:
> add SoC performance monitor utilities
>=20
> Note: This patch will remain here until those utilities are moved outside=
 the
> Weston package.
>=20
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-graphics/wayland/weston_1.11.0.bbappend | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 recipes-graphics/wayland/weston_1.11.0.bbappend
>=20
> diff --git a/recipes-graphics/wayland/weston_1.11.0.bbappend b/recipes-
> graphics/wayland/weston_1.11.0.bbappend
> new file mode 100644
> index 0000000..7349e71
> --- /dev/null
> +++ b/recipes-graphics/wayland/weston_1.11.0.bbappend
> @@ -0,0 +1,7 @@
> +PR_append =3D ".tisdk0"
> +
> +# SoC Performance Monitoring Utility
> +
> +SRC_URI +=3D " \
> +	file://0001-Add-soc-performance-monitor-utilites.patch \ "
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

