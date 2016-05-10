Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 051EB529EA
	for <meta-arago@arago-project.org>;
	Tue, 10 May 2016 14:32:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4AEWaTW007290;
	Tue, 10 May 2016 09:32:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4AEWac2007414;
	Tue, 10 May 2016 09:32:36 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Tue, 10 May 2016 09:32:35 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] systemd: provide symlink to libudev.so.0,
	required by SGX libs/bins
Thread-Index: AQHRqfxUP4nsjYftSU29r+x1SruNuZ+yjFSA//+xSes=
Date: Tue, 10 May 2016 14:32:34 +0000
Message-ID: <f9be806e-8324-4b97-a889-c7028746ca0e@email.android.com>
References: <1462802934-30099-1-git-send-email-denis@denix.org>,
	<4B26FB5A64EBA14C87266869E037F9581426EDC8@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581426EDC8@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Tue, 10 May 2016 14:32:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I know

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, May 09, 2016 10:09 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] systemd: provide symlink to libudev.so.0,
> required by SGX libs/bins
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> eudev and systemd bumped major version number to libudev.so.1, but SGX
> has
> version 0 hardcoded. Symlink for now, until binaries can be rebuilt.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-
> core/systemd/systemd_%.bbappend
>
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
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

