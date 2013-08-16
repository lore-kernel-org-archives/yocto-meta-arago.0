Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by arago-project.org (Postfix) with ESMTPS id CBB57529A0
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2013 02:29:27 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1344317pad.16
	for <meta-arago@arago-project.org>;
	Thu, 15 Aug 2013 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=v/tWzSDJ+oT/bPuQLaG6/RG4cAmj1OKJKx17bow9HOQ=;
	b=GllqBffFk4tnYMpu3ocjCNSQFSA1Td2lGaw76du0PQhaawNBUJktU73JuluUwR0wdG
	xXyY6NJ0nw9ssmA5DdLXxtzoYZJeGVJRCppDD4Lan2Ihbk/A5jYY68tVP91BfeUdm90G
	Q106CZVVwY/k3Pd4un1QXaKkJkYPMft+kk9E/xuMK9Id7HcduAFPqn/q6W4c+UEDvZTM
	OQnPP011s9QemPE1hUDNmp4OnFpo/kGeEMjsEjhr0YjMlkFYBSmS0XUEn8YwY3LQuKUX
	lCAEUu7MS8m1FSQHm9m4Uc1Bailty2gQui4mgNzgJ9AUIhdYIsTB1QuzyLWfoD/Fh7K7
	NkqA==
X-Received: by 10.68.2.69 with SMTP id 5mr18738500pbs.124.1376620166252;
	Thu, 15 Aug 2013 19:29:26 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id yo2sm115171pab.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 19:29:25 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520D8E81.8080501@gna.org>
Date: Fri, 16 Aug 2013 14:29:21 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
Subject: meta-toolchain-arago-tisdk failed to build
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
X-List-Received-Date: Fri, 16 Aug 2013 02:29:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I was trying to build meta-toolchain-arago-tisdk, but it failed because 
"nothing provides packagegroup-arago-cross-canadian-arm", I couldn't 
find this recipe anywhere in meta-arago.

Maybe I should modify configs/arago-dylan-config.txt to use a known good 
tag for meta-arago? Are the tags tested somehow (at least built)?

Here is the log:

Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-13.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2013.07"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:25f815a91093952db8d7232315fcae85a628e2a3"
toolchain-layer
meta-networking
meta-oe           = "dylan:13ae5105ee30410136beeae66ec41ee4a8a2e2b0"
meta-ti           = "dylan:cc1a67b39d8a958f86f30dae5e955b2347745063"
meta-linaro-toolchain = "dylan:7ab5e76aac4344e1a228b620f469e868e7914f2f"
meta              = "dylan:acf46cb2eb03c2ed3aadd7858044ba2837a83292"

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'packagegroup-arago-cross-canadian-arm'
NOTE: Runtime target 'packagegroup-arago-cross-canadian-arm' is 
unbuildable, removing...
Missing or unbuildable dependency chain was: 
['packagegroup-arago-cross-canadian-arm']
ERROR: Required build target 'meta-toolchain-arago-tisdk' has no 
buildable providers.
Missing or unbuildable dependency chain was: 
['meta-toolchain-arago-tisdk', 'packagegroup-arago-cross-canadian-arm'] 


Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


Any hint appreciated.

Regards,
Chris



