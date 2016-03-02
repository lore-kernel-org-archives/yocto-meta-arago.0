Return-Path: <anton.gerasimov@openmailbox.org>
Received: from smtp3.openmailbox.org (smtp3.openmailbox.org [62.4.1.37])
	by arago-project.org (Postfix) with ESMTPS id 4C23452A7D
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 15:47:06 +0000 (UTC)
Received: by mail2.openmailbox.org (Postfix, from userid 1004)
	id EE65A2ACA5D8; Wed,  2 Mar 2016 16:47:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=openmailbox.org;
	s=openmailbox; t=1456933624;
	bh=kykYwyPYcONUu36EeIX64j3wzAmmg7At39gZHLprx5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dlgBNwBuurC6TiD6b3KXb5nRRvD8ddedGkvRay/9agMWUgDoSYOv6vgxsttPqn9I+
	hTIyGE+81/dkUitH4g+rLshBiPQFuO8Er4xSTOG+xmSQJDp5qNLSYXcvDbzMG+elzD
	KIorPkrT7kIL3ISkqoeCMmQ+2xEeBgRIZvuXIQJ4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on openmailbox-b2
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DKIM_ADSP_ALL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from www.openmailbox.org (openmailbox-b1 [10.91.69.218])
	by mail2.openmailbox.org (Postfix) with ESMTP id 9689E2ACA53C;
	Wed,  2 Mar 2016 16:46:55 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 02 Mar 2016 18:46:55 +0300
From: anton.gerasimov@openmailbox.org
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20160302150829.GB7505@edge>
References: <a997894609107b25e5d70de8ab1c2b34@openmailbox.org>
	<20160302150829.GB7505@edge>
Message-ID: <9b7bbc1e8acebd2e42d243366eddec37@openmailbox.org>
X-Sender: anton.gerasimov@openmailbox.org
User-Agent: Roundcube Webmail/1.0.6
Cc: meta-arago@arago-project.org
Subject: Re: Compiling with internal toolchain
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
X-List-Received-Date: Wed, 02 Mar 2016 15:47:06 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I set it in my local.conf. Here's the whole file (comments stripped):

BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
MACHINE = "varsomam33"
DISTRO ?= "arago"
PACKAGE_CLASSES ?= "package_ipk"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
IMAGE_INSTALL_append = " gdbserver"
USER_CLASSES ?= "buildstats image-mklibs image-prelink"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
     STOPTASKS,${TMPDIR},1G,100K \
     STOPTASKS,${DL_DIR},1G,100K \
     STOPTASKS,${SSTATE_DIR},1G,100K \
     ABORT,${TMPDIR},100M,1K \
     ABORT,${DL_DIR},100M,1K \
     ABORT,${SSTATE_DIR},100M,1K"
PACKAGECONFIG_pn-qemu-native = "sdl"
PACKAGECONFIG_pn-nativesdk-qemu = "sdl"
ASSUME_PROVIDED += "libsdl-native"
CONF_VERSION = "1"
PRSERV_HOST = "localhost:0"
TOOLCHAIN_BRAND ?= "gcc"
TOOLCHAIN_TYPE ?= "internal"


On 2016-03-02 18:08, Denys Dmytriyenko wrote:
> On Wed, Mar 02, 2016 at 05:01:17PM +0300, 
> anton.gerasimov@openmailbox.org wrote:
>> I'm trying to compile arago-test-image for varsomam33 machine and
>> arago distro with internal toolchain. When bitbake reaches cmem_mod,
> 
> How do you select internal toolchain?
> 
> 
>> I get the following error "make[3]: arm-oe-linuxeabi-gcc: Command
>> not found".
>> And arm-oe-linuxeabi-gcc is really not built, real target toolchain
>> is called arm-oe-linux-gnueabi-gcc.
>> After running bitbake -e I see that arm-oe-linuxeabi is the value of
>> TOOLCHAIN_SYS:
>> 
>> # $TOOLCHAIN_SYS
>> #   immediate 
>> /home/a-gerasimov/Yocto/meta-arago/meta-arago-distro/conf/distro/include/toolchain-gcc.inc:6
>> #     "${TARGET_SYS}"
>> TOOLCHAIN_SYS="arm-oe-linuxeabi"
>> 
>> But TARGET_SYS is set to arm-oe-linux-gnueabi:
>> 
>> # $TARGET_SYS [2 operations]
>> #   set /home/a-gerasimov/Yocto/poky/meta/conf/bitbake.conf:118
>> #     "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
>> True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
>> #   set /home/a-gerasimov/Yocto/poky/meta/conf/documentation.conf:415
>> #     [doc] "The target system is comprised of
>> TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
>> # pre-expansion value:
>> #   "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
>> True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
>> TARGET_SYS="arm-oe-linux-gnueabi"
>> 
>> It seems that for some reason when toolchain-gcc.inc is included
>> into distro/arago.conf, TARGET_SYS is set to some weird value, not
>> the one that is set by bitbake.conf. Do you have any ideas about how
>> that is possible and how it can be debugged.
>> Thank you!
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


