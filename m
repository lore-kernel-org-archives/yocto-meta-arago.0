Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 7FBF35209D
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:18:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF008LVFQAJCW1@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Oct 2012 21:18:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1340920120; Wed,
	24 Oct 2012 22:18:10 -0400 (EDT)
Date: Wed, 24 Oct 2012 22:18:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121025021810.GE3465@denix.org>
References: <1351127995-16678-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1351127995-16678-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Franklin S Cooper Jr <fcooper@ti.com>
Subject: Re: [PATCH v5] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Thu, 25 Oct 2012 02:18:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 24, 2012 at 08:19:55PM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
> 
> * Create new task-arago-tisdk-connectivity task including host and target
>   versions. The contents of these tasks were originally located in
>   task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
>   the target version.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>

Ack, will push tomorrow.

> ---
> Version 5 changes:
> Use the standard 4 spaces for indentation
> Update comments
> 
> Version 4 changes:
> Removed COMPATIBLE_MACHINE
> Added PACKAGE_ARCH and ALLOW_EMPTY when needed.
> 
> Version 3 changes:
> Removed bt-objex since it was renamed to bluez-tools which was already added.
> Removed recipes from the RDEPENDS if they still haven't been commited to
> meta-ti.
> 
>  .../task-arago-tisdk-connectivity-sdk-host.bb      |   30 +++++++
>  .../task-arago-tisdk-connectivity-sdk-target.bb    |   37 ++++++++
>  .../tasks/task-arago-tisdk-connectivity.bb         |   87 ++++++++++++++++++++
>  3 files changed, 154 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
> new file mode 100644
> index 0000000..92a6353
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +ALLOW_EMPTY = "1"
> +
> +FIRMWARE_AND_DRIVERS_SRC = "
> +    ti-compat-wireless-wl12xx-src \
> +    ti-compat-bluetooth-src \
> +    bt-firmware-src \
> +    bt-enable-src \
> +"
> +
> +CONNECTIVITY_RDEPENDS = ""
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below lists once the recipes
> +# have been added to meta-ti
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm = ""
> +CONNECTIVITY_RDEPENDS_am180x-evm = ""
> +CONNECTIVITY_RDEPENDS_ti33x = ""
> +
> +RDEPENDS_${PN} = "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
> new file mode 100644
> index 0000000..a60bd34
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "Task to install wlan and bluetooth headers and libraries into the SDK"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +ALLOW_EMPTY = "1"
> +
> +# Bluetooth development packages
> +BLUETOOTH_STACK = "\
> +    bluez4-dev \
> +    openobex-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS = ""
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm = "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS_am180x-evm = "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS_ti33x  = "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> new file mode 100644
> index 0000000..1cbd0cc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> @@ -0,0 +1,87 @@
> +DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PR = "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +ALLOW_EMPTY = "1"
> +
> +# WLAN support packages.
> +# These are the packages that all platforms use for WLAN support
> +WLAN_COMMON = "\
> +    hostap-daemon \
> +    ti-wifi-utils \
> +    wireless-tools \
> +    htop \
> +    netperf \
> +    iw \
> +    crda \
> +    softap-udhcpd-config \
> +    oppserver \
> +    bluez-tools \
> +    obexd \
> +    pulseaudio \
> +    pulseaudio-server \
> +    pulseaudio-module-loopback \
> +    pulseaudio-module-bluetooth-discover \
> +    pulseaudio-module-bluetooth-device \
> +    eventdump \
> +    wpa-supplicant \
> +"
> +
> +FIRMWARE_AND_DRIVERS = "\
> +    ti-compat-wireless-wl12xx \
> +    ti-compat-bluetooth \
> +    bt-firmware \
> +    bt-enable \
> +    wl12xx-firmware \
> +"
> +
> +BLUETOOTH_STACK = "\
> +    bluez4 \
> +    bluez4-agent \
> +    libasound-module-bluez \
> +    bluez-hcidump \
> +    openobex \
> +    openobex-apps \
> +    obexftp \
> +    ussp-push \
> +"
> +
> +# Need to add battleship to the below list once the application has been fixed
> +DEMO_APPS = "\
> +    bluetooth-gui \
> +    wifi-direct-demo \
> +    wpa-gui-e \
> +    wl1271-demo \
> +"
> +
> +CONNECTIVITY_RDEPENDS = ""
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS} to the below lists once the recipes have
> +# been added to meta-ti
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm = "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +CONNECTIVITY_RDEPENDS_am180x-evm  = "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +CONNECTIVITY_RDEPENDS_ti33x = "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

