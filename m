Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EDE1A52A88
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 20:31:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KKVLcx018929;
	Fri, 20 Sep 2013 15:31:21 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KKVLEk015692;
	Fri, 20 Sep 2013 15:31:21 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 15:31:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOtjOrf6IhCDQdC0WSxKtxZdgs95nPFFQ7
Date: Fri, 20 Sep 2013 20:31:21 +0000
Message-ID: <20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
In-Reply-To: <1379703595-1330-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Fri, 20 Sep 2013 20:31:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will this still package things like the patches applied on top of the kerne=
l in the kernel sources?
On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-dis=
tro/classes/sourceipk.bbclass
> index 1ea0577..777cb4f 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
>         fi
>=20
>         #Write the data tarball
> -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf $srcipk_dir/data.t=
ar.gz .
> +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf $srcipk_dir/data.ta=
r.gz .
>=20
>         # Create the debian-binary file
>         echo "2.0" > $srcipk_dir/debian-binary
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

