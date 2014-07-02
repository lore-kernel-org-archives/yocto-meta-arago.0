Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9F33152A5D
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 13:00:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62D0JNd015425;
	Wed, 2 Jul 2014 08:00:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62D0Ii2022571;
	Wed, 2 Jul 2014 08:00:18 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 2 Jul 2014 08:00:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, Denys Dmytriyenko
	<denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-image.bbclass: update for the new
	rootfs/image infrastructure
Thread-Index: AQHPlWGMg1tASeMrv0aWWahAN004L5uLtrVggAEIeDA=
Date: Wed, 2 Jul 2014 13:00:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D108C96@DLEE11.ent.ti.com>
References: <1404242399-15206-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6D8314@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D8314@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk-image.bbclass: update for the new rootfs/image infrastructure
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
X-List-Received-Date: Wed, 02 Jul 2014 13:00:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 01, 2014 4:10 PM
>To: Denys Dmytriyenko; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] tisdk-image.bbclass: update for
>the new rootfs/image infrastructure
>
>Thanks for this!
>Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>> Sent: Tuesday, July 01, 2014 2:20 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH] tisdk-image.bbclass: update for
>the new
>> rootfs/image infrastructure
>>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> The entire rootfs/image processing infrastructure was rewritten
>in Python for
>> Daisy release. Since tisdk_image class is based on rootfs/image
>base classes
>> and uses their APIs, some adjustments are required in order for
>it to work.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>  meta-arago-distro/classes/tisdk-image.bbclass | 83
>+++++++++++++--------------
>>  1 file changed, 39 insertions(+), 44 deletions(-)
>>
>> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
>b/meta-arago-
>> distro/classes/tisdk-image.bbclass
>> index b100261..6023d6b 100644
>> --- a/meta-arago-distro/classes/tisdk-image.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
>> @@ -65,18 +65,18 @@ def string_set(iterable):
>>
>>  # Add a dependency for the do_rootfs function that will force
>us to build  #
>> the TARGET_IMAGES first so that they will be available for
>packaging.
>> -do_sdk_image[depends] +=3D "${@string_set('%s:do_rootfs' % pn for
>pn in
>> (d.getVar("TARGET_IMAGES", True) or "").split())}"
>> +do_rootfs[depends] +=3D "${@string_set('%s:do_rootfs' % pn for pn
>in
>> (d.getVar("TARGET_IMAGES", True) or "").split())}"
>>
>>  # Add a dependency for the do_populate_sdk function of the
>> TIDSK_TOOLCHAIN  # variable which will force us to build the
>toolchain first so
>> that it will be  # available for packaging -
>do_sdk_image[depends] +=3D
>> "${@string_set('%s:do_populate_sdk' % pn for pn in
>> (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
>> +do_rootfs[depends] +=3D "${@string_set('%s:do_populate_sdk' % pn
>for pn in
>> (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
>>
>> -do_sdk_image[nostamp] =3D "1"
>> -do_sdk_image[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
>> -do_sdk_image[cleandirs] +=3D "${S}"
>> +do_rootfs[nostamp] =3D "1"
>> +do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
>> +do_rootfs[cleandirs] +=3D "${S}"
>>
>> -# Call the cleanup_host_packes to remove packages that should
>be removed
>> from
>> +# Call the cleanup_host_packages to remove packages that should
>be
>> +removed from
>>  # the host for various reasons.  This may include licensing
>issues as well.
>>  OPKG_POSTPROCESS_COMMANDS =3D "cleanup_host_packages; "
>>
>> @@ -92,25 +92,6 @@ cleanup_host_packages() {
>>      fi
>>  }
>>
>> -# Copy log_check from image.bbclass since the
>rootfs_ipk_do_rootfs function
>> -# uses it, but we are not inheriting the full image class.
>> -log_check() {
>> -	for target in $*
>> -	do
>> -		lf_path=3D"${WORKDIR}/temp/log.do_$target.${PID}"
>> -
>> -		echo "log_check: Using $lf_path as logfile"
>> -
>> -		if test -e "$lf_path"
>> -		then
>> -			${IMAGE_PKGTYPE}_log_check $target $lf_path
>> -		else
>> -			echo "Cannot find logfile [$lf_path]"
>> -		fi
>> -		echo "Logfile is clean"
>> -	done
>> -}
>> -
>>  # Generate the header for a TI style software manifest
>>  sw_manifest_header() {
>>  echo "
>> @@ -235,7 +216,7 @@ echo "
>>
>>  # Create the host side toolchain components table
>>  sw_manifest_toolchain_host() {
>> -
>opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-
>> linux/var/lib/opkg/info"
>> +
>opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-
>> linux/var/lib/opkg"
>>
>>  echo "
>>  <h2><u>GPLv3 Development Host Content</u></h2> @@ -471,24
>+452,43
>> @@ generate_sw_manifest() {
>>      sw_manifest_footer
>>  }
>>
>> +ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
>> +ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
>> +IMAGE_PREPROCESS_COMMAND +=3D "tisdk_image_cleanup; "
>> +
>>  # Create the SDK image.  We will re-use the
>rootfs_ipk_do_rootfs
>> functionality  # to install a given list of packages using opkg.
>> -do_sdk_image () {
>> -	set -x
>> -	rm -rf ${IMAGE_ROOTFS}
>> -	mkdir -p ${IMAGE_ROOTFS}
>> -	mkdir -p ${DEPLOY_DIR_IMAGE}
>> +fakeroot python do_rootfs () {
>> +    from oe.rootfs import create_rootfs
>> +    from oe.image import create_image
>> +    from oe.manifest import create_manifest
>> +
>> +    # generate the initial manifest
>> +    create_manifest(d)

What about the generate_sw_manifest function?

Overall I think this is a step in the right direction though, so ACK for th=
is patch.  Just curious if we should expect more.

>> +
>> +    # generate rootfs
>> +    create_rootfs(d)
>> +
>> +    # generate final images
>> +    create_image(d)
>> +}
>> +
>> +tisdk_image_setup () {
>> +    set -x
>> +    rm -rf ${IMAGE_ROOTFS}
>> +    mkdir -p ${IMAGE_ROOTFS}
>> +    mkdir -p ${DEPLOY_DIR_IMAGE}
>>
>> -	mkdir -p ${IMAGE_ROOTFS}/etc
>> +    mkdir -p ${IMAGE_ROOTFS}/etc
>> +    mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
>>
>>      chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-
>> ${TARGET_OS}-tisdk*
>>
>>      # Temporarily extract the toolchain sdk so we can read
>license information
>> from it.
>>      echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" |
>> ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
>> +}
>>
>> -    # Creat the base SDK image
>> -	rootfs_${IMAGE_PKGTYPE}_do_rootfs
>> -
>> +tisdk_image_build () {
>>      mkdir -p ${IMAGE_ROOTFS}/filesystem
>>
>>      # Copy the TARGET_IMAGES to the sdk image before packaging
>@@ -
>> 607,23 +607,18 @@ do_sdk_image () {
>>
>>      # Copy the opkg.conf used by the image to allow for future
>updates
>>      cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>> +}
>>
>> +tisdk_image_cleanup () {
>>      # Move the var/etc directories which contains the opkg data
>used for the
>>      # manifest (and maybe one day for online updates) to a
>hidden directory.
>>      mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
>>      mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
>> -
>> -    # Create the image directory symlinks
>> -    # $ { @ get_imagecmds(d) }
>>  }
>>
>>  license_create_manifest() {
>>      :
>>  }
>>
>> -rootfs_install_complementary() {
>> -    :
>> -}
>> -
>> -EXPORT_FUNCTIONS do_sdk_image
>> -addtask sdk_image before do_build after do_install
>> +EXPORT_FUNCTIONS do_rootfs
>> +addtask rootfs before do_build after do_install
>> --
>> 2.0.0
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

