Subject: Re: [tisdk-build-scripts][PATCH 08/10] Remove calls to packaging, reporting, testing and copying functionality
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:14:03 -0800
References: <1637640060-31733-21-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-21-git-send-email-denis@denix.org>
Message-ID: <29796.1638227643354388492@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="rVvbzjtlxEYCiXpQ1J4p"

--rVvbzjtlxEYCiXpQ1J4p
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
> build-oesdk.sh | 47 -----------------------------------------------
> 1 file changed, 47 deletions(-)
>=20
> diff --git a/build-oesdk.sh b/build-oesdk.sh
> index 038a7ab..fb5f725 100755
> --- a/build-oesdk.sh
> +++ b/build-oesdk.sh
> @@ -8,11 +8,8 @@ trap 'test -z "`jobs -p`" || kill `jobs -p` > /dev/null
> 2>&1; echo "I got a sign
> # script.
> source ./lib/oesdk/config-build-env
> source ./lib/common-functions
> -source ./lib/run-opentest
> source ./lib/oesdk/bitbake-test-sdk-image
> source ./lib/oesdk/machine-specific-functions
> -source ./lib/oesdk/package-sdks
> -source ./lib/oesdk/generate-report
>=20
> # This variable holds the architectures that are being built based
> # on the machines.
> @@ -193,48 +190,4 @@ done
> # Wait for all build and test processes to finish
> wait
>=20
> -# Package the SDKs
> -if [ "$PRODUCTIZE_SDK" =3D=3D "true" ]
> -then
> - package_sdks
> -fi
> -
> -# Assemble the build report
> -generate_report
> -
> -# If COPY_TO_WEB is set then copy to the WEB_HOST. If we did not
> -# productize the SDK then there is not much need to copy the files.
> -if [ "$COPY_TO_WEB" =3D=3D "true" ]
> -then
> - if [ "$PRODUCTIZE_SDK" =3D=3D "true" ]
> - then
> - echo "Copying productized images"
> - scp -r $DEPLOY_ROOT $WEB_HOST/
> - # If the copy went well then clean out the DEPLOY_ROOT directory
> - # If the CLEAN_AFTER_COPY variable is true.
> - # TODO: Maybe this should be cleaned by jenkins if I want that.
> - if [ "$?" =3D=3D "0" ]
> - then
> - if [ "$CLEAN_AFTER_COPY" =3D=3D "true" ]
> - then
> - rm -rf $DEPLOY_ROOT
> - fi
> - fi
> - fi
> -
> - # If COPY_DEPLOY_TO_WEB is set then copy to the WEB_HOST.
> - if [ "$COPY_DEPLOY_TO_WEB" =3D=3D "true" ]
> - then
> - echo "Copying deploy/ directory"
> - rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/deploy/
> $WEB_HOST/deploy/
> - fi
> -
> - # If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
> - if [ "$COPY_GOLDEN_TO_WEB" =3D=3D "true" ]
> - then
> - echo "Copying golden/ directory"
> - rsync -az --delete $BUILD_ROOT/build-*/golden/ $WEB_HOST/golden/
> - fi
> -fi
> -
> echo "Build Finished"
> --
> 2.7.4

--rVvbzjtlxEYCiXpQ1J4p
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />build-oesdk.sh | 47 ----------------------------------=
-------------<br />1 file changed, 47 deletions(-)<br /><br />diff --git a/=
build-oesdk.sh b/build-oesdk.sh<br />index 038a7ab..fb5f725 100755<br />---=
 a/build-oesdk.sh<br />+++ b/build-oesdk.sh<br />@@ -8,11 +8,8 @@ trap 'tes=
t -z "`jobs -p`" || kill `jobs -p` &gt; /dev/null 2&gt;&amp;1; echo "I got =
a sign<br /># script.<br />source ./lib/oesdk/config-build-env<br />source =
./lib/common-functions<br />-source ./lib/run-opentest<br />source ./lib/oe=
sdk/bitbake-test-sdk-image<br />source ./lib/oesdk/machine-specific-functio=
ns<br />-source ./lib/oesdk/package-sdks<br />-source ./lib/oesdk/generate-=
report<br /><br /># This variable holds the architectures that are being bu=
ilt based<br /># on the machines.<br />@@ -193,48 +190,4 @@ done<br /># Wai=
t for all build and test processes to finish<br />wait<br /><br />-# Packag=
e the SDKs<br />-if [ "$PRODUCTIZE_SDK" =3D=3D "true" ]<br />-then<br />- p=
ackage_sdks<br />-fi<br />-<br />-# Assemble the build report<br />-generat=
e_report<br />-<br />-# If COPY_TO_WEB is set then copy to the WEB_HOST. If=
 we did not<br />-# productize the SDK then there is not much need to copy =
the files.<br />-if [ "$COPY_TO_WEB" =3D=3D "true" ]<br />-then<br />- if [=
 "$PRODUCTIZE_SDK" =3D=3D "true" ]<br />- then<br />- echo "Copying product=
ized images"<br />- scp -r $DEPLOY_ROOT $WEB_HOST/<br />- # If the copy wen=
t well then clean out the DEPLOY_ROOT directory<br />- # If the CLEAN_AFTER=
_COPY variable is true.<br />- # TODO: Maybe this should be cleaned by jenk=
ins if I want that.<br />- if [ "$?" =3D=3D "0" ]<br />- then<br />- if [ "=
$CLEAN_AFTER_COPY" =3D=3D "true" ]<br />- then<br />- rm -rf $DEPLOY_ROOT<b=
r />- fi<br />- fi<br />- fi<br />-<br />- # If COPY_DEPLOY_TO_WEB is set t=
hen copy to the WEB_HOST.<br />- if [ "$COPY_DEPLOY_TO_WEB" =3D=3D "true" ]=
<br />- then<br />- echo "Copying deploy/ directory"<br />- rsync -az --del=
ete $BUILD_ROOT/build-*/arago-tmp*/deploy/ $WEB_HOST/deploy/<br />- fi<br /=
>-<br />- # If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.<br />- =
if [ "$COPY_GOLDEN_TO_WEB" =3D=3D "true" ]<br />- then<br />- echo "Copying=
 golden/ directory"<br />- rsync -az --delete $BUILD_ROOT/build-*/golden/ $=
WEB_HOST/golden/<br />- fi<br />-fi<br />-<br />echo "Build Finished"<br />=
-- <br />2.7.4</blockquote>

--rVvbzjtlxEYCiXpQ1J4p--
