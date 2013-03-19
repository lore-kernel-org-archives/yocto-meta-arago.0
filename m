Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 65ED652A51
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 18:59:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JIx8n1015244
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 13:59:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JIx8eR012191
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 13:59:08 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 19 Mar 2013 13:59:08 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 19 Mar 2013 13:59:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2013.03 build
	2013-03-18_23-01-06
Thread-Index: AQHOJMtdYOTamks0R0WECwrL+kV6X5itXSzg
Date: Tue, 19 Mar 2013 18:59:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EAA74@DFLE09.ent.ti.com>
References: <1186596819.57.1363666176762.JavaMail.jenkins@puget>
	<20130319175128.GR32759@edge>
In-Reply-To: <20130319175128.GR32759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [nightly] Core TISDK 2013.03 build	2013-03-18_23-01-06
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
X-List-Received-Date: Tue, 19 Mar 2013 18:59:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, March 19, 2013 12:51 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [nightly] Core TISDK 2013.03 build 2013-03-18_2=
3-
> 01-06
>=20
> Ok, the build results are now much better!
>=20
> The only broken build is for the beagleboard with the latest Graphics SDK=
 and I
> believe Franklin already has a fix for that - I'll wait for a patch.

Beagleboard builds fine I had one kernel panic but that was a onetime runti=
me issue and we couldn't conclude if it was a Graphics issue or not. What w=
as the build failure?

>=20
> And as of the run-time tests - I'm still tweaking some things and updatin=
g
> configuration... The console logs show that 3 out of 4 tested boards actu=
ally
> were able to boot, but there were some testing hick-ups. I am also switch=
ing to
> a different board farm, that is geographically closer to me (i.e. local),=
 so should
> have slightly better control over this aspect.
>=20
> Stay tuned!
>=20
> --
> Denys
>=20
>=20
> On Tue, Mar 19, 2013 at 12:09:36AM -0400, Denys Dmytriyenko wrote:
> > Status for 03/19/13
> >
> > BUILD_ID: build-2013-03-18_23-02-13
> >
> > Clean Build: false
> >
> > Clean Sources: false
> >
> > Repository Revisions
> >
> > +----------------------------------------------------------------------=
-----------------------------
> -------------------------+
> > |   Repository    |                     Git URL                     |Br=
anch|Commit|
> Layers                  |
> > |                 |                                                 |  =
    |  ID  |
> |
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |bitbake          |git://git.openembedded.org/bitbake
> |master|1.17.0|layers=3D                                   |
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |meta-arago       |git://arago-project.org/git/meta-arago.git
> |master|HEAD  |layers=3Dmeta-arago-distro:meta-arago-extras|
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |meta-openembedded|git://git.openembedded.org/meta-openembedded
> |danny |HEAD  |layers=3Dtoolchain-layer:meta-oe            |
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |meta-ti          |git://arago-project.org/git/meta-ti.git          |da=
nny |HEAD
> |layers=3D                                   |
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |meta-linaro      |git://git.linaro.org/openembedded/meta-linaro.git|da=
nny
> |HEAD  |layers=3D                                   |
> > |-----------------+-------------------------------------------------+--=
----+------+---------------
> ---------------------------|
> > |oe-core          |git://git.openembedded.org/openembedded-core     |da=
nny
> |HEAD  |layers=3Dmeta                               |
> > +----------------------------------------------------------------------=
-----------------------------
> -------------------------+
> >
> > Build and Target Test Results
> >
> >    +-------------------------------------------+
> >    |  Machine  |Build Result|Target Test Result|
> >    |-----------+------------+------------------|
> >    |am335x-evm |PASSED      |FAILED            |
> >    |-----------+------------+------------------|
> >    |am37x-evm  |PASSED      |FAILED            |
> >    |-----------+------------+------------------|
> >    |beagleboard|FAILED      |SKIPPED           |
> >    |-----------+------------+------------------|
> >    |am3517-evm |PASSED      |FAILED            |
> >    |-----------+------------+------------------|
> >    |am180x-evm |PASSED      |FAILED            |
> >    +-------------------------------------------+
> >
> >    These builds were performed using the build-oesdk.sh script at:
> >
> >    git://arago-project.org/git/projects/tisdk-build-scripts.git
> >
> >    The configuration file passed to this script had the contents:
> >
> >    MANDATORY_INPUTS=3D"MACHINES NUM_ARM9_BUILDS
> NUM_CORTEX_BUILDS BUILD_ID
> >    SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT
> FS_FILTER
> >    SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE
> LOG_DIR
> >    TISDK_VERSION"
> >    TISDK_VERSION=3D"2013.03"
> >    MACHINES=3D"am335x-evm am37x-evm beagleboard am3517-evm am180x-
> evm"
> >    NUM_ARM9_BUILDS=3D"1"
> >    NUM_CORTEX_BUILDS=3D"1"
> >    TOOLCHAIN_ROOT_ARM9=3D"/opt/arago-2011.09/armv5te/bin/"
> >    TOOLCHAIN_ROOT_CORTEX=3D"/opt/arago-2011.09/armv7a/bin/"
> >    BUILD_ID=3D"`date +build-%F_%H-%M-%S`"
> >    SCRIPTS_ROOT=3D"$PWD"
> >    BUILD_ROOT=3D"/home/jenkins/tisdk-build"
> >    TEST_ROOT=3D"$BUILD_ROOT/testing"
> >    PACKAGE_ROOT=3D"$BUILD_ROOT/packaging"
> >    DEPLOY_ROOT=3D"$BUILD_ROOT/deploy/$TISDK_VERSION"
> >    FS_FILTER=3D"tisdk-rootfs-"
> >    FS_IMAGE_TYPE=3D"tar.gz"
> >    SDK_FILTER=3D"arago-amsdk-image-"
> >    SDK_IMAGE_TYPE=3D"tar.gz"
> >    NFS_ROOT=3D"/home/jenkins/nfs-root"
> >    SOURCE_DIR=3D"${BUILD_ROOT}/sources"
> >    CLEAN_BUILD=3D"false"
> >    CLEAN_ALL=3D"false"
> >    CONFIG_FILE=3D"${BUILD_ROOT}/configs/arago-danny-config.txt"
> >    LOG_DIR=3D"${BUILD_ROOT}/log-files"
> >    DL_DIR=3D"/OE/downloads"
> >    INSTALLER_EXTRAS_ROOT=3D"/home/jenkins/extra-files/installer_content=
"
> >    TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
> >    TEST_SCRIPTS_TGT=3D"home/root/test-scripts"
> >    TEST_LOCAL_IFACE=3D"eth1"
> >    OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> >    RUN_BUILD_TESTS=3D"true"
> >    STAF_ROOT=3D"/usr/local/staf"
> >    SKIP_TEST_FAILURES=3D"false"
> >    PRODUCTIZE_SDK=3D"false"
> >    BITBAKE_COMMAND=3D"arago-amsdk-image"
> >    RESULTS_CONFIG_COMMENTS=3D"false"
> >    INSTALL_JAMMER=3D"/home/jenkins/installjammer"
> >    INSTALLER_ROOT=3D"$BUILD_ROOT/installer"
> >    MPI_FILE=3D"$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"
> >    SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >    WEBGEN_ROOT=3D"/home/jenkins/webgen"
> >    WEB_EXTRAS_ROOT=3D"/home/jenkins/extra-files/web_content"
> >    WEBGEN_MAK_ROOT=3D"$SCRIPTS_ROOT/publish-sdk-data"
> >    COPY_TO_WEB=3D"true"
> >    WEB_HOST=3D""
> >    CLEAN_AFTER_COPY=3D"true"
> >    BACKUP_RESULTS=3D"/home/jenkins/jobs/arago-core-tisdk-
> nightly/workspace"
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

