Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id C108752AAB
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 20:37:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCE00LJOZXTEIF0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Oct 2012 15:37:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 105BD2038D; Wed,
	24 Oct 2012 16:37:04 -0400 (EDT)
Date: Wed, 24 Oct 2012 16:37:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121024203704.GC3465@denix.org>
References: <1350598301-17285-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1350598301-17285-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Franklin S Cooper Jr <fcooper@ti.com>
Subject: Re: [PATCH v4] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Wed, 24 Oct 2012 20:37:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 18, 2012 at 05:11:41PM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
> 
> * Create new task-arago-tisdk-connectivity task including host and target
>   versions. The contents of these tasks were originally located in
>   task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
>   the target version.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 4 changes:
>  Removed COMPATIBLE_MACHINE.
>  Added PACKAGE_ARCH and ALLOW_EMPTY when needed.
> 
> Version 3 changes:
>  Removed bt-obex since it was renamed to bluez-tools which was
>  already added.
>  Removed recieps from the RDEPENDS if they still haven't been
>  commited to
>  meta-ti. Only firmware/drivers related recipes fall under this
>  catagory.
> 
>  .../task-arago-tisdk-connectivity-sdk-host.bb      |   29 +++++++
>  .../task-arago-tisdk-connectivity-sdk-target.bb    |   37 +++++++++
>  .../tasks/task-arago-tisdk-connectivity.bb         |   85 ++++++++++++++++++++
>  3 files changed, 151 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
> new file mode 100644
> index 0000000..f2f3929
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
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
> +FIRMWARE_AND_DRIVERS_SRC = "ti-compat-wireless-wl12xx-src \
> +                            ti-compat-bluetooth-src \
> +                            bt-firmware-src \
> +                            bt-enable-src \
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
> index 0000000..29fd828
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
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
> +     wpa-supplicant-dev \

Is it 4 spaces or 5?


> +"
> +
> +CONNECTIVITY_RDEPENDS_am180x-evm = "\
> +    ${BLUETOOTH_STACK} \
> +     wpa-supplicant-dev \

Same as above


> +"
> +
> +CONNECTIVITY_RDEPENDS_ti33x  = "\
> +    ${BLUETOOTH_STACK} \
> +     wpa-supplicant-dev \

And again


> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> new file mode 100644
> index 0000000..8c838f7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
> @@ -0,0 +1,85 @@
> +DESCRIPTION = "Task to install wlan and bluetooth packages into target FS"
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
> +WLAN_COMMON = "hostap-daemon \
> +               ti-wifi-utils \
> +               wireless-tools \
> +               htop \
> +               netperf \
> +               iw \
> +               crda \
> +               softap-udhcpd-config \
> +               oppserver \
> +               bluez-tools \
> +               obexd \
> +               pulseaudio \
> +               pulseaudio-server \
> +               pulseaudio-module-loopback \
> +               pulseaudio-module-bluetooth-discover \
> +               pulseaudio-module-bluetooth-device \
> +               eventdump \
> +               wpa-supplicant \
> +"
> +
> +FIRMWARE_AND_DRIVERS = "ti-compat-wireless-wl12xx \
> +                        ti-compat-bluetooth \
> +                        bt-firmware \
> +                        bt-enable \
> +                        wl12xx-firmware \
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

Can we use consistent spacing at least withing the same recipe? It's 15, then 
it's 24 and now it's 4...


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
> +      ${WLAN_COMMON} \
> +      ${BLUETOOTH_STACK} \
> +      ${DEMO_APPS} \

And here it's 6 spaces...


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

