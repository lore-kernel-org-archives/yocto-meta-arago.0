Return-Path: <jon@beiwy.com>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by arago-project.org (Postfix) with ESMTPS id 1E0BB52A27
	for <meta-arago@arago-project.org>;
	Mon, 13 Mar 2017 18:32:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8366B20852
	for <meta-arago@arago-project.org>;
	Mon, 13 Mar 2017 14:32:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Mon, 13 Mar 2017 14:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=BPCQW3uEvRpPFl
	pbYSrUsPvajh0=; b=N05k2f5P+cV9iCf7N0h58G9/MKasITSIjbhSHTJxyTVVQP
	xJDt5o3nwspKs/BZPc4iRsAQtozy6lDhlWpl9pjKv7LCEa8dUkgPoQwywIwsgC48
	67HXnetFVEF4iLIWy4WricN8uL8mfVAiSsLSpHtrs/e8Wcnb5Dm/89vcumMqQ=
X-ME-Sender: <xms:z-XGWM5DcskxokhvIfKHOCFlqy4ZQsFGQwmrYBJlGcoY76-Cn4VHzw>
X-Sasl-enc: /EakaQtQoqJQp+8GsLb6EXhyK8efllRyy7soE3OdaA2T 1489429967
Received: from JonThinkpad (c-67-165-223-215.hsd1.co.comcast.net
	[67.165.223.215])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2E265246E4
	for <meta-arago@arago-project.org>;
	Mon, 13 Mar 2017 14:32:47 -0400 (EDT)
From: "Jonathan Stackhouse" <jon@beiwy.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Mar 2017 12:32:46 -0600
Message-ID: <000001d29c28$365bdaa0$a3138fe0$@beiwy.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdKcJ+5iyCjjIYB7Qua6+kU80Wf8zA==
Subject: core-image-weston with meta-arago?
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
X-List-Received-Date: Mon, 13 Mar 2017 18:32:47 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Hello,

I'm trying to get a core-image-weston image to build with meta-arago for a
custom board, but am having difficulties. I've followed the steps outlined
on the Setting Up Build Environment page of the Arago Project website [1],
with the exception that I'm using the Linaro 6.2.1-2016.11 toolchain and I
used the arago-morty-next-config.txt configuration.

I was originally hoping that TI had a core-image-weston style image that I
could use, but there's no meta-arago/recipes-graphics/images directory. This
made me assume that I could build core-image-weston, since I can build
core-image-minimal, and get the results I was hoping for with minimal
effort. Apparently, I was wrong. When I attempt to build core-image-weston,
I get the following errors (please note that I've set MACHINE equal to my
machine in conf/local.conf):

vb@thinkVB:~/yoctoproject/tisdk/build$ bitbake core-image-weston
NOTE: Started PRServer with DBfile:
/home/vb/yoctoproject/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
42107, PID: 15505 Loading cache: 100%
|###########################################################################
############################################################################
##################| Time: 0:00:01 Loaded 3033 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/mesa' (but
/home/vb/yoctoproject/tisdk/sources/oe-core/meta/recipes-gnome/gtk+/gtk+3_3.
20.9.bb DEPENDS on or otherwise requires it)
ERROR: mesa PROVIDES virtual/mesa but was skipped:
PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, not mesa
ERROR: mesa PROVIDES virtual/mesa but was skipped:
PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, not mesa
ERROR: mesa-gl PROVIDES virtual/mesa but was skipped:
PREFERRED_PROVIDER_virtual/mesa set to mesa, not mesa-gl
NOTE: Runtime target 'gtk+3-demo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gtk+3-demo', 'virtual/mesa']
ERROR: Required build target 'core-image-weston' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-weston',
'gtk+3-demo', 'virtual/mesa']

I also get the same results when building for the am335x-evm.

Is it supposed to be possible to build a core-image-weston style image with
meta-arago? If so, does anyone have pointers on how I can get it to work? My
end goal is to get boot2qt on my device, but I've been trying to work at all
of this step-by-step. 

Both core-image-minimal and arago-console-image work on my board.

[1] - http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

Thank you,

Jon Stackhouse


