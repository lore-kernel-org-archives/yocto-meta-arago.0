Return-Path: <chgans@googlemail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by arago-project.org (Postfix) with ESMTPS id 3692852A38
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 02:26:30 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so7801292pbc.37
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ajNavC77AwU00pBrWtlWir8DkUSH6LOhw31UBpCgCZg=;
	b=aMvqkSEk3X4Jx5W28wLcWgdEOEV1g8WUyZabNPS/8/kV4U9Uo3BRcd9ugpcJkcG9fH
	kNv5w/u3Z1R8ThcxhZknKWLbOSWXhJYB0jmtscGLzoEq5UgKIlvK5EY7YSEgjfAA5YRh
	YhFPqMQ/zWTYADuWthqzTmE14wMdMqkEmrJcRhu7RA9pEnL9W3qPStQlvFXtDQOFtGgD
	bqhch01eBiZ2vjLZ+OfgRhngxUFa2QYv+HJ0P7eUYMJmfpqyhJHs9E9mjJ1Q7WY2Bmm8
	pzr0tah7aFsUhTNMUtbHw7IJHMi3tw3jI08ugtjHyoxFdw9Z+sqfe1WVq/N4OURC7E9q
	aAYg==
X-Received: by 10.66.178.143 with SMTP id cy15mr30479125pac.105.1374546388869; 
	Mon, 22 Jul 2013 19:26:28 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id s5sm38657803pbo.38.2013.07.22.19.26.26
	for <meta-arago@arago-project.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 19:26:27 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51EDE9D0.2000003@gna.org>
Date: Tue, 23 Jul 2013 14:26:24 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <1331708251.407.1374386154381.JavaMail.jenkins@puget>
In-Reply-To: <1331708251.407.1374386154381.JavaMail.jenkins@puget>
Subject: Re: [nightly] Core TISDK 2013.06 build 2013-07-21_01-01-44
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
X-List-Received-Date: Tue, 23 Jul 2013 02:26:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I have been looking at these test/build reports recently, is there a 
more detail report available somewhere?
As a user of a am335x-evm and a BeagleBoard Black, I would like to know 
more about test failure for the EVM.

As well, I'm considering moving from Arago/Danny (kernel 3.2) to 
Arago/Dylan (kernel 3.8?). I would like to know if there are any plan to 
use Dylan for the next stable Arago.

Also, do you think it is conceivable to hope for a working Qt5 with TI 
OpenGL stuff?

Regards,
Chris


On 21/07/13 17:55, Denys Dmytriyenko wrote:
> Status for 07/21/13
>
>
>     Status for 07/21/13
>
>
>     BUILD_ID: build-2013-07-21_01-02-45
>
>
>     Clean Build: false
>
>
>     Clean Sources: false
>
>
>     _Repository Revisions_
>
> Repository 	Git URL 	Branch 	Commit ID 	Layers
> bitbake 	git://git.openembedded.org/bitbake 	master 	1.17.0 	layers=
> meta-arago 	git://arago-project.org/git/meta-arago.git 	danny 	HEAD 
> layers=meta-arago-distro:meta-arago-extras
> meta-openembedded 	git://git.openembedded.org/meta-openembedded 
> danny 	HEAD 	layers=toolchain-layer:meta-oe
> meta-ti 	git://arago-project.org/git/meta-ti.git 	danny 	HEAD 	layers=
> meta-linaro 	git://git.linaro.org/openembedded/meta-linaro.git 
> danny 	HEAD 	layers=
> oe-core 	git://git.openembedded.org/openembedded-core 	danny 	HEAD 
> layers=meta
>
>
>     _Build and Target Test Results_
>
> Machine 	Build Result 	Target Test Result
> am335x-evm 	PASSED 	FAILED
> am37x-evm 	PASSED 	PASSED
> omap5-evm 	FAILED 	SKIPPED
> dra7xx-evm 	FAILED 	SKIPPED
> beagleboard 	PASSED 	PASSED
> am3517-evm 	PASSED 	PASSED
> am180x-evm 	PASSED 	FAILED
>
> These builds were performed using the build-oesdk.sh script at:
>
> git://arago-project.org/git/projects/tisdk-build-scripts.git
>
> The configuration file passed to this script had the contents:
>
> MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID 
> SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER 
> SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR 
> TISDK_VERSION"
> TISDK_VERSION="2013.06"
> MACHINES="am335x-evm am37x-evm omap5-evm dra7xx-evm beagleboard 
> am3517-evm am180x-evm"
> NUM_ARM9_BUILDS="1"
> NUM_CORTEX_BUILDS="1"
> TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"
> TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2013.03/bin/"
> BUILD_ID="`date +build-%F_%H-%M-%S`"
> SCRIPTS_ROOT="$PWD"
> BUILD_ROOT="/home/jenkins/tisdk-build"
> TEST_ROOT="$BUILD_ROOT/testing"
> PACKAGE_ROOT="$BUILD_ROOT/packaging"
> DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
> FS_FILTER="tisdk-rootfs-"
> FS_IMAGE_TYPE="tar.gz"
> SDK_FILTER="arago-core-tisdk-image-"
> SDK_IMAGE_TYPE="tar.gz"
> NFS_ROOT="/home/jenkins/nfs-root"
> SOURCE_DIR="${BUILD_ROOT}/sources"
> CLEAN_BUILD="false"
> CLEAN_ALL="false"
> CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"
> LOG_DIR="${BUILD_ROOT}/log-files"
> DL_DIR="/OE/downloads"
> INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
> TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
> TEST_SCRIPTS_TGT="home/root/test-scripts"
> TEST_LOCAL_IFACE="eth1"
> OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> OPENTEST_TEE_IP="10.218.102.142"
> RUN_BUILD_TESTS="true"
> STAF_ROOT="/usr/local/staf"
> SKIP_TEST_FAILURES="false"
> PRODUCTIZE_SDK="false"
> BITBAKE_COMMAND="arago-core-tisdk-image"
> RESULTS_CONFIG_COMMENTS="false"
> INSTALL_JAMMER="/home/jenkins/installjammer"
> INSTALLER_ROOT="$BUILD_ROOT/installer"
> MPI_FILE="$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"
> SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
> PACKAGE_BOOT_UIMAGE="false"
> WEBGEN_ROOT="/home/jenkins/webgen"
> WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
> WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"
> COPY_TO_WEB="true"
> WEB_HOST=""
> CLEAN_AFTER_COPY="true"
> BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


