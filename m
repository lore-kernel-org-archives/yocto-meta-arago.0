Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 21790529C2
	for <meta-arago@arago-project.org>;
	Tue, 10 May 2016 14:14:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4AEEJ1U027429;
	Tue, 10 May 2016 09:14:19 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4AEEJUa026653;
	Tue, 10 May 2016 09:14:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 10 May 2016 09:14:19 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] systemd: provide symlink to libudev.so.0,
	required by SGX libs/bins
Thread-Index: AQHRqfxeLfXDn6sU+EKVFCX3VHgjbZ+yNf2A
Date: Tue, 10 May 2016 14:14:19 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426EDC8@DFLE09.ent.ti.com>
References: <1462802934-30099-1-git-send-email-denis@denix.org>
In-Reply-To: <1462802934-30099-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH] systemd: provide symlink to libudev.so.0, required by SGX libs/bins
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
X-List-Received-Date: Tue, 10 May 2016 14:14:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, May 09, 2016 10:09 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] systemd: provide symlink to libudev.so.0,
> required by SGX libs/bins
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> eudev and systemd bumped major version number to libudev.so.1, but SGX
> has
> version 0 hardcoded. Symlink for now, until binaries can be rebuilt.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-
> core/systemd/systemd_%.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> new file mode 100644
> index 0000000..05c8e34
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D "-arago0"

PR_append should begin with a ".", not a "-". Otherwise builds with PR serv=
ice, and buildhistory will fail as the version goes backwards. http://www.o=
penembedded.org/wiki/Versioning_Policy

> +
> +do_install_append() {
> +    install -d ${D}/${base_libdir}
> +    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
> +}
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

