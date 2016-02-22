Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 926EE529D3
	for <meta-arago@arago-project.org>;
	Mon, 22 Feb 2016 15:46:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1MFk2nF024615
	for <meta-arago@arago-project.org>; Mon, 22 Feb 2016 09:46:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1MFk2ot016298
	for <meta-arago@arago-project.org>; Mon, 22 Feb 2016 09:46:02 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 22 Feb 2016 09:46:02 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-setup-scripts] [PATCH] setup-targetfs-nfs:
	update extracting of filesystem tarball(s) in a for loop
Thread-Index: AQHRazRKNPwG3ltDK0uGXm0jfwE9wZ84Ocwg
Date: Mon, 22 Feb 2016 15:46:02 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B717BD@DLEE08.ent.ti.com>
References: <1455900046-4338-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1455900046-4338-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [tisdk-setup-scripts] [PATCH] setup-targetfs-nfs: update extracting of filesystem tarball(s) in a for loop
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
X-List-Received-Date: Mon, 22 Feb 2016 15:46:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Friday, February 19, 2016 11:41 AM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [tisdk-setup-scripts] [PATCH] setup-targetfs-nfs:
> update extracting of filesystem tarball(s) in a for loop
>=20
> * keystone platforms now have tisdk-server-extra rootfs tarball in additi=
on
>   to the tisdk-server rootfs tarball, while other platforms still have a
>   single tisdk-server rootfs tarball. The keystone extra rootfs tarball i=
s
>   a super set of its base rootfs tarball, and it is provided for mounting
>   over NFS.
>=20
>   Adding the for loop here provides a simple solution to correctly extrac=
t
>   the filesystem for NFS mounting for all the platforms.
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  setup-targetfs-nfs.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh index
> d8d6805..b27f7c4 100644
> --- a/setup-targetfs-nfs.sh
> +++ b/setup-targetfs-nfs.sh
> @@ -60,7 +60,7 @@ extract_fs() {
>      me=3D`whoami`
>      sudo mkdir -p $1
>      check_status
> -    sudo tar xzf $fstar -C $1
> +    for i in $fstar; do sudo tar xzf $i -C $1;done
>      check_status
>      sudo chown $me:$me $1
>      check_status
> --
> 1.9.1


