Return-Path: <anton.gerasimov@openmailbox.org>
Received: from smtp14.openmailbox.org (smtp14.openmailbox.org [62.4.1.48])
	by arago-project.org (Postfix) with ESMTPS id F111B52AC2
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 14:01:19 +0000 (UTC)
Received: by mail2.openmailbox.org (Postfix, from userid 1004)
	id 96DD92AC9C2D; Wed,  2 Mar 2016 15:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=openmailbox.org;
	s=openmailbox; t=1456927278;
	bh=yGTa6felf+T95BlmDVXz1Bd0uTguene8hemYQXn9aHc=;
	h=Date:From:To:Subject:From;
	b=LwoLK1XjVsH+wV4+iQ7M5EDBb2Q8p4tgYW6fNRDhGO4o8sDDevKUNE31kVA4f0tsu
	lmKnIimkqMX6NK90epxZDhW2rBqzl6Wxk4J+p4Q8B2hBZ+2H7g7wmnglLKq5utBt97
	mrijBXfe1T9CpbnAYxlSAEuhCntcN2Ic9I/sydwA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on openmailbox-b2
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DKIM_ADSP_ALL autolearn=no autolearn_force=no version=3.4.0
Received: from www.openmailbox.org (openmailbox-b1 [10.91.69.218])
	by mail2.openmailbox.org (Postfix) with ESMTP id 72F442AC9B98
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 15:01:17 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 02 Mar 2016 17:01:17 +0300
From: anton.gerasimov@openmailbox.org
To: meta-arago@arago-project.org
Message-ID: <a997894609107b25e5d70de8ab1c2b34@openmailbox.org>
X-Sender: anton.gerasimov@openmailbox.org
User-Agent: Roundcube Webmail/1.0.6
Subject: Compiling with internal toolchain
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
X-List-Received-Date: Wed, 02 Mar 2016 14:01:20 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to compile arago-test-image for varsomam33 machine and arago 
distro with internal toolchain. When bitbake reaches cmem_mod, I get the 
following error "make[3]: arm-oe-linuxeabi-gcc: Command not found".
And arm-oe-linuxeabi-gcc is really not built, real target toolchain is 
called arm-oe-linux-gnueabi-gcc.
After running bitbake -e I see that arm-oe-linuxeabi is the value of 
TOOLCHAIN_SYS:

# $TOOLCHAIN_SYS
#   immediate 
/home/a-gerasimov/Yocto/meta-arago/meta-arago-distro/conf/distro/include/toolchain-gcc.inc:6
#     "${TARGET_SYS}"
TOOLCHAIN_SYS="arm-oe-linuxeabi"

But TARGET_SYS is set to arm-oe-linux-gnueabi:

# $TARGET_SYS [2 operations]
#   set /home/a-gerasimov/Yocto/poky/meta/conf/bitbake.conf:118
#     "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', 
True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
#   set /home/a-gerasimov/Yocto/poky/meta/conf/documentation.conf:415
#     [doc] "The target system is comprised of TARGET_ARCH,TARGET_VENDOR 
and TARGET_OS."
# pre-expansion value:
#   "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', 
True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
TARGET_SYS="arm-oe-linux-gnueabi"

It seems that for some reason when toolchain-gcc.inc is included into 
distro/arago.conf, TARGET_SYS is set to some weird value, not the one 
that is set by bitbake.conf. Do you have any ideas about how that is 
possible and how it can be debugged.
Thank you!

