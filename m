Subject: Re: [tisdk-build-scripts][PATCH 10/10] Adjust default BUILD_DIR to be relative to SCRIPTS_DIR
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:14:57 -0800
References: <1637640060-31733-23-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-23-git-send-email-denis@denix.org>
Message-ID: <17673.1638227697043576121@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="sQNaCuNGdzo5VLLQhDDJ"

--sQNaCuNGdzo5VLLQhDDJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:

>=20
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Jonathan Humphreys <j-humphreys@ti.com>

>=20
> ---
> configs/farm/arago-dunfell-next.txt | 2 +-
> configs/farm/arago-dunfell.txt | 2 +-
> configs/farm/arago-master.txt | 2 +-
> configs/farm/distroless-dunfell.txt | 2 +-
> configs/farm/distroless-master.txt | 2 +-
> configs/farm/poky-dunfell.txt | 2 +-
> configs/farm/poky-master.txt | 2 +-
> 7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/configs/farm/arago-dunfell-next.txt
> b/configs/farm/arago-dunfell-next.txt
> index 5d8c6a2..74b1094 100644
> --- a/configs/farm/arago-dunfell-next.txt
> +++ b/configs/farm/arago-dunfell-next.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-arago-dunfell-next"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-arago-dunfell-next-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/arago-dunfell.txt
> b/configs/farm/arago-dunfell.txt
> index dfa3afa..e099df2 100644
> --- a/configs/farm/arago-dunfell.txt
> +++ b/configs/farm/arago-dunfell.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-arago-dunfell"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-arago-dunfell-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.tx=
t
>=20
> index 22712dc..0779ded 100644
> --- a/configs/farm/arago-master.txt
> +++ b/configs/farm/arago-master.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-arago-master"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-arago-master-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/distroless-dunfell.txt
> b/configs/farm/distroless-dunfell.txt
> index 7a42300..16e0b69 100644
> --- a/configs/farm/distroless-dunfell.txt
> +++ b/configs/farm/distroless-dunfell.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-distroless-dunfell"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-distroless-dunfell-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/distroless-master.txt
> b/configs/farm/distroless-master.txt
> index c6b85aa..9684f03 100644
> --- a/configs/farm/distroless-master.txt
> +++ b/configs/farm/distroless-master.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-distroless-master"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-distroless-master-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/poky-dunfell.txt b/configs/farm/poky-dunfell.tx=
t
>=20
> index a39ad5a..7a45515 100644
> --- a/configs/farm/poky-dunfell.txt
> +++ b/configs/farm/poky-dunfell.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-poky-dunfell"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-poky-dunfell-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
> index 7b8032e..95d78d1 100644
> --- a/configs/farm/poky-master.txt
> +++ b/configs/farm/poky-master.txt
> @@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"
> # - BUILD_ROOT/arm9-1/arago-tmp
> # - BUILD_ROOT/cortex-1/arago-tmp
> # - BUILD_ROOT/cortex-2/arago-tmp
> -BUILD_ROOT=3D"/OE/farm-poky-master"
> +BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-poky-master-build"
>=20
> # This variable points to the base location where files will be extracted
> for
> # testing purposes. This should not be confused with the NFS root which
> --
> 2.7.4

--sQNaCuNGdzo5VLLQhDDJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />configs/farm/arago-dunfell-next.txt | 2 +-<br />config=
s/farm/arago-dunfell.txt | 2 +-<br />configs/farm/arago-master.txt | 2 +-<b=
r />configs/farm/distroless-dunfell.txt | 2 +-<br />configs/farm/distroless=
-master.txt | 2 +-<br />configs/farm/poky-dunfell.txt | 2 +-<br />configs/f=
arm/poky-master.txt | 2 +-<br />7 files changed, 7 insertions(+), 7 deletio=
ns(-)<br /><br />diff --git a/configs/farm/arago-dunfell-next.txt b/configs=
/farm/arago-dunfell-next.txt<br />index 5d8c6a2..74b1094 100644<br />--- a/=
configs/farm/arago-dunfell-next.txt<br />+++ b/configs/farm/arago-dunfell-n=
ext.txt<br />@@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"<br /># - BUILD_ROOT/ar=
m9-1/arago-tmp<br /># - BUILD_ROOT/cortex-1/arago-tmp<br /># - BUILD_ROOT/c=
ortex-2/arago-tmp<br />-BUILD_ROOT=3D"/OE/farm-arago-dunfell-next"<br />+BU=
ILD_ROOT=3D"$SCRIPTS_ROOT/farm-arago-dunfell-next-build"<br /><br /># This =
variable points to the base location where files will be extracted for<br /=
># testing purposes. This should not be confused with the NFS root which<br=
 />diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell=
.txt<br />index dfa3afa..e099df2 100644<br />--- a/configs/farm/arago-dunfe=
ll.txt<br />+++ b/configs/farm/arago-dunfell.txt<br />@@ -62,7 +62,7 @@ SCR=
IPTS_ROOT=3D"$PWD"<br /># - BUILD_ROOT/arm9-1/arago-tmp<br /># - BUILD_ROOT=
/cortex-1/arago-tmp<br /># - BUILD_ROOT/cortex-2/arago-tmp<br />-BUILD_ROOT=
=3D"/OE/farm-arago-dunfell"<br />+BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-arago-du=
nfell-build"<br /><br /># This variable points to the base location where f=
iles will be extracted for<br /># testing purposes. This should not be conf=
used with the NFS root which<br />diff --git a/configs/farm/arago-master.tx=
t b/configs/farm/arago-master.txt<br />index 22712dc..0779ded 100644<br />-=
-- a/configs/farm/arago-master.txt<br />+++ b/configs/farm/arago-master.txt=
<br />@@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"<br /># - BUILD_ROOT/arm9-1/ar=
ago-tmp<br /># - BUILD_ROOT/cortex-1/arago-tmp<br /># - BUILD_ROOT/cortex-2=
/arago-tmp<br />-BUILD_ROOT=3D"/OE/farm-arago-master"<br />+BUILD_ROOT=3D"$=
SCRIPTS_ROOT/farm-arago-master-build"<br /><br /># This variable points to =
the base location where files will be extracted for<br /># testing purposes=
. This should not be confused with the NFS root which<br />diff --git a/con=
figs/farm/distroless-dunfell.txt b/configs/farm/distroless-dunfell.txt<br /=
>index 7a42300..16e0b69 100644<br />--- a/configs/farm/distroless-dunfell.t=
xt<br />+++ b/configs/farm/distroless-dunfell.txt<br />@@ -62,7 +62,7 @@ SC=
RIPTS_ROOT=3D"$PWD"<br /># - BUILD_ROOT/arm9-1/arago-tmp<br /># - BUILD_ROO=
T/cortex-1/arago-tmp<br /># - BUILD_ROOT/cortex-2/arago-tmp<br />-BUILD_ROO=
T=3D"/OE/farm-distroless-dunfell"<br />+BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-di=
stroless-dunfell-build"<br /><br /># This variable points to the base locat=
ion where files will be extracted for<br /># testing purposes. This should =
not be confused with the NFS root which<br />diff --git a/configs/farm/dist=
roless-master.txt b/configs/farm/distroless-master.txt<br />index c6b85aa..=
9684f03 100644<br />--- a/configs/farm/distroless-master.txt<br />+++ b/con=
figs/farm/distroless-master.txt<br />@@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD=
"<br /># - BUILD_ROOT/arm9-1/arago-tmp<br /># - BUILD_ROOT/cortex-1/arago-t=
mp<br /># - BUILD_ROOT/cortex-2/arago-tmp<br />-BUILD_ROOT=3D"/OE/farm-dist=
roless-master"<br />+BUILD_ROOT=3D"$SCRIPTS_ROOT/farm-distroless-master-bui=
ld"<br /><br /># This variable points to the base location where files will=
 be extracted for<br /># testing purposes. This should not be confused with=
 the NFS root which<br />diff --git a/configs/farm/poky-dunfell.txt b/confi=
gs/farm/poky-dunfell.txt<br />index a39ad5a..7a45515 100644<br />--- a/conf=
igs/farm/poky-dunfell.txt<br />+++ b/configs/farm/poky-dunfell.txt<br />@@ =
-62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"<br /># - BUILD_ROOT/arm9-1/arago-tmp<b=
r /># - BUILD_ROOT/cortex-1/arago-tmp<br /># - BUILD_ROOT/cortex-2/arago-tm=
p<br />-BUILD_ROOT=3D"/OE/farm-poky-dunfell"<br />+BUILD_ROOT=3D"$SCRIPTS_R=
OOT/farm-poky-dunfell-build"<br /><br /># This variable points to the base =
location where files will be extracted for<br /># testing purposes. This sh=
ould not be confused with the NFS root which<br />diff --git a/configs/farm=
/poky-master.txt b/configs/farm/poky-master.txt<br />index 7b8032e..95d78d1=
 100644<br />--- a/configs/farm/poky-master.txt<br />+++ b/configs/farm/pok=
y-master.txt<br />@@ -62,7 +62,7 @@ SCRIPTS_ROOT=3D"$PWD"<br /># - BUILD_RO=
OT/arm9-1/arago-tmp<br /># - BUILD_ROOT/cortex-1/arago-tmp<br /># - BUILD_R=
OOT/cortex-2/arago-tmp<br />-BUILD_ROOT=3D"/OE/farm-poky-master"<br />+BUIL=
D_ROOT=3D"$SCRIPTS_ROOT/farm-poky-master-build"<br /><br /># This variable =
points to the base location where files will be extracted for<br /># testin=
g purposes. This should not be confused with the NFS root which<br />-- <br=
 />2.7.4</blockquote>

--sQNaCuNGdzo5VLLQhDDJ--
