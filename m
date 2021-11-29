Subject: Re: [tisdk-build-scripts][PATCH 09/10] If no configs specified, initialize LOG_DIR correctly
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:14:18 -0800
References: <1637640060-31733-22-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-22-git-send-email-denis@denix.org>
Message-ID: <17673.1638227658941714582@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="JrKuUT9QKtdLO9hymN2P"

--JrKuUT9QKtdLO9hymN2P
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
> build-oesdk.sh | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/build-oesdk.sh b/build-oesdk.sh
> index fb5f725..9534d99 100755
> --- a/build-oesdk.sh
> +++ b/build-oesdk.sh
> @@ -22,6 +22,11 @@ CORTEX_MACHINE=3D""
> # List of all the dynamically created architecture lists
> LISTS=3D""
>=20
> +if [ -z $LOG_DIR ]
> +then
> + LOG_DIR=3D"."
> +fi
> +
> usage() {
> echo "write something"
> exit 0
> --
> 2.7.4

--JrKuUT9QKtdLO9hymN2P
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />build-oesdk.sh | 5 +++++<br />1 file changed, 5 insert=
ions(+)<br /><br />diff --git a/build-oesdk.sh b/build-oesdk.sh<br />index =
fb5f725..9534d99 100755<br />--- a/build-oesdk.sh<br />+++ b/build-oesdk.sh=
<br />@@ -22,6 +22,11 @@ CORTEX_MACHINE=3D""<br /># List of all the dynamic=
ally created architecture lists<br />LISTS=3D""<br /><br />+if [ -z $LOG_DI=
R ]<br />+then<br />+ LOG_DIR=3D"."<br />+fi<br />+<br />usage() {<br />ech=
o "write something"<br />exit 0<br />-- <br />2.7.4</blockquote>

--JrKuUT9QKtdLO9hymN2P--
