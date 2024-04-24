Return-Path: <charles.cc.zhang@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F037DC07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:55:26 +0000 (UTC)
Subject: TMDSSK3358 am335x-pru0-fw firmware load failure
To: meta-arago@lists.yoctoproject.org
From: charles.cc.zhang@gmail.com
X-Originating-Location: =?UTF-8?B?Tnlrw7ZwaW5nLCBTw7ZkZXJtYW5sYW5kIENvdW50eSwgU0U=?= (77.91.218.123)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 06:55:22 -0700
Message-ID: <M6Km.1713957686485366841.d3N4@lists.yoctoproject.org>
X-Old-Date: Wed, 24 Apr 2024 04:21:26 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 13:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15304
Message-ID: <20240424135522.RNfE2-MMEEizRuBSYTs6-W85iLS_5Az2_56I_ohtKS8@z>

Hi,
I am trying out the Arago build for TI AM335x Starter Kit (TMDSSK3358).
I built the image with:
> git clone https://git.ti.com/git/arago-project/oe-layersetup.git tisdk
> cd tisdk/
> ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-kirkstone-=
09.02.01.09-config.txt
> cd build/
> . conf/setenv
> MACHINE=3Dam335x-evm ARAGO_RT_ENABLE=3D1 bitbake -k tisdk-base-image

Then I boot the image and try to load the firmware with the following error=
:
> root@am335x-evm:~# dmesg | grep pru
> [   29.717917] remoteproc remoteproc0: 4a334000.pru is available
> [   29.739480] remoteproc remoteproc1: 4a338000.pru is available
> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc0/firmware
> am335x-pru0-fw
> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc0/state
> offline
> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc1/firmware
> am335x-pru1-fw
> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc1/state
> offline
> root@am335x-evm:~# echo 'start' > /sys/class/remoteproc/remoteproc0/state
> [  119.827705] remoteproc remoteproc0: powering up 4a334000.pru
> [  119.827895] remoteproc remoteproc0: Direct firmware load for am335x-pr=
u0-fw failed with error -2
> -sh: echo: write error: No such file or directory[  119.827921] remotepro=
c remoteproc0: request_firmware failed: -2
>=20
> [  119.827930] remoteproc remoteproc0: Boot failed: -2
> root@am335x-evm:~# dmesg | grep pru
> [   29.717917] remoteproc remoteproc0: 4a334000.pru is available
> [   29.739480] remoteproc remoteproc1: 4a338000.pru is available
> [  119.827705] remoteproc remoteproc0: powering up 4a334000.pru
> [  119.827895] remoteproc remoteproc0: Direct firmware load for am335x-pr=
u0-fw failed with error -2

If I look at the firmware folder:
> root@am335x-evm:~# ls /lib/firmware/ti-pruss/
> am335x-pru0-prueth-fw.elf  am335x-pru0-pruprp-fw.elf  am335x-pru1-pruhsr-=
fw.elf
> am335x-pru0-pruhsr-fw.elf  am335x-pru1-prueth-fw.elf  am335x-pru1-pruprp-=
fw.elf

I also tried:
> echo 'am335x-pru0-prueth-fw' > /sys/class/remoteproc/remoteproc0/firmware
> root@am335x-evm:~# echo 'start' > /sys/class/remoteproc/remoteproc0/state
> -sh: echo: write error: No such file or directory
> [  458.718686] remoteproc remoteproc0: powering up 4a334000.pru  th error=
 -2
> [  458.718819] remoteproc remoteproc0: request_firmware failed: -2irmware=
 load for am335x-pru0-prueth-fw failed wit
> [  458.718828] remoteproc remoteproc0: Boot failed: -2

Could you please help me on this issue? Thanks in advance!
Best regards,
Charles

