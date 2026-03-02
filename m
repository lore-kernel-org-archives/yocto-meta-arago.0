Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2929EB3632
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 20:41:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2169.1772484057929088858
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 12:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECBFD40BD4;
	Mon,  2 Mar 2026 20:40:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nYmpXtIB-xC; Mon,  2 Mar 2026 20:40:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50B0840A2F;
	Mon,  2 Mar 2026 20:40:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 769391794D6; Mon,  2 Mar 2026 15:40:51 -0500 (EST)
Date: Mon, 2 Mar 2026 15:40:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: danishanwar@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com,
	c-shilwant@ti.com
Subject: Re: [meta-arago][master][PATCH v2] linuxptp: Add support for HSR
 in Linux ptp
Message-ID: <20260302204051.GF11121@denix.org>
References: <20260302103515.848554-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302103515.848554-1-danishanwar@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17176

On Mon, Mar 02, 2026 at 04:05:15PM +0530, MD Danish Anwar via lists.yocto=
project.org wrote:
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
> These patches have been posted to upstream linuxptp mailing list.
> https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00013.html
> They are currently under review.
>=20
> v1 -> v2:
>   Added Upstream Status in each patch.
>=20
>  .../linuxptp/linuxptp-arago.inc               |  19 +
>  ...age-of-non-PTP-packets-during-socket.patch |  81 +++
>  ...d-dataset_comparison-type-IEC62439-3.patch | 217 +++++++
>  .../0003-Add-PASSIVE_SLAVE-state.patch        | 275 +++++++++
>  .../0004-rtnl-Add-rtnl_get_hsr_devices.patch  | 120 ++++
>  .../0005-port-Add-paired_port-option.patch    | 175 ++++++
>  ...-a-state-engine-for-redundant-master.patch | 519 ++++++++++++++++
>  ...ouble-attached-clock-hybrid-clock-HC.patch | 444 ++++++++++++++
>  ...orward-packets-both-ways-in-DAC-mode.patch |  37 ++
>  ...guard-in-case-PASSIVE_SLAVE-attempts.patch |  37 ++
>  ...w-to-forward-packets-in-LISTEN-state.patch |  61 ++
>  .../linuxptp/0011-raw-Add-HSR-handling.patch  | 567 ++++++++++++++++++
>  ...Add-sample-configs-for-the-HSR-setup.patch |  96 +++
>  ...2p_dst_mac-to-avoid-IEEE-802.1-reser.patch |  47 ++
>  .../linuxptp/linuxptp_%.bbappend              |   4 +
>  15 files changed, 2699 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp-arago.inc
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0002-port-Add-dataset_comparison-type-IEC62439-3.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0003-Add-PASSIVE_SLAVE-state.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0005-port-Add-paired_port-option.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0006-fsm-Add-a-state-engine-for-redundant-master.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0011-raw-Add-HSR-handling.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0012-configs-Add-sample-configs-for-the-HSR-setup.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp/0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/lin=
uxptp_%.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-a=
rago.inc b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago=
.inc
> new file mode 100644
> index 00000000..17819cf3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.in=
c
> @@ -0,0 +1,19 @@
> +PR:append =3D ".arago6"

This is the first submission, why is it .arago6?


> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/linuxptp:"
> +
> +SRC_URI:append =3D " \

There's absolutely no reason to suee :append here vs. a simple +=3D


> +    file://0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.p=
atch \
> +    file://0002-port-Add-dataset_comparison-type-IEC62439-3.patch \
> +    file://0003-Add-PASSIVE_SLAVE-state.patch \
> +    file://0004-rtnl-Add-rtnl_get_hsr_devices.patch \
> +    file://0005-port-Add-paired_port-option.patch \
> +    file://0006-fsm-Add-a-state-engine-for-redundant-master.patch \
> +    file://0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.pat=
ch \
> +    file://0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patc=
h \
> +    file://0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.p=
atch \
> +    file://0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch \
> +    file://0011-raw-Add-HSR-handling.patch \
> +    file://0012-configs-Add-sample-configs-for-the-HSR-setup.patch \
> +    file://0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.p=
atch \
> +"
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch b/meta-ara=
go-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage=
-of-non-PTP-packets-during-socket.patch
> new file mode 100644
> index 00000000..ea0f968c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw=
-Prevent-leakage-of-non-PTP-packets-during-socket.patch
> @@ -0,0 +1,81 @@
> +From 5afe386619bfcded393fd5a9ea5d7c9bbcf05823 Mon Sep 17 00:00:00 2001
> +From: Cliff Spradlin <cspradlin@google.com>
> +Date: Thu, 2 Oct 2025 18:37:54 -0700
> +Subject: [PATCH 01/13] raw: Prevent leakage of non-PTP packets during =
socket
> + init
> +
> +There were two problems with the socket configuration sequencing:
> +
> +1) Calling socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)) causes all
> +ethernet frames from -all- interfaces to be queued to the socket,
> +until bind() is later called.
> +
> +2) The BPF filter is installed -after- bind() is called, so ethernet
> +frames that should be rejected could be queued before the BPF filter
> +is installed.
> +
> +This patch reorders the raw socket initialization so that all
> +configuration happens before bind() is called.
> +
> +Signed-off-by: Cliff Spradlin <cspradlin@google.com>
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00007.h=
tml

While there's no specific requirement to have this before the --- line, i=
t=20
still must be in a single line. Same comment to all patches.


> +
> + raw.c | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/raw.c b/raw.c
> +index 94c59ad..c809233 100644
> +--- a/raw.c
> ++++ b/raw.c
> +@@ -241,7 +241,7 @@ static int open_socket(const char *name, int event=
, unsigned char *local_addr,
> + 	struct sockaddr_ll addr;
> + 	int fd, index;
> +=20
> +-	fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
> ++	fd =3D socket(AF_PACKET, SOCK_RAW, 0);
> + 	if (fd < 0) {
> + 		pr_err("socket failed: %m");
> + 		goto no_socket;
> +@@ -250,6 +250,16 @@ static int open_socket(const char *name, int even=
t, unsigned char *local_addr,
> + 	if (index < 0)
> + 		goto no_option;
> +=20
> ++	if (socket_priority > 0 &&
> ++	    setsockopt(fd, SOL_SOCKET, SO_PRIORITY, &socket_priority,
> ++		       sizeof(socket_priority))) {
> ++		pr_err("setsockopt SO_PRIORITY failed: %m");
> ++		goto no_option;
> ++	}
> ++	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
> ++			  p2p_dst_mac, 1))
> ++		goto no_option;
> ++
> + 	memset(&addr, 0, sizeof(addr));
> + 	addr.sll_ifindex =3D index;
> + 	addr.sll_family =3D AF_PACKET;
> +@@ -263,16 +273,6 @@ static int open_socket(const char *name, int even=
t, unsigned char *local_addr,
> + 		goto no_option;
> + 	}
> +=20
> +-	if (socket_priority > 0 &&
> +-	    setsockopt(fd, SOL_SOCKET, SO_PRIORITY, &socket_priority,
> +-		       sizeof(socket_priority))) {
> +-		pr_err("setsockopt SO_PRIORITY failed: %m");
> +-		goto no_option;
> +-	}
> +-	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
> +-			  p2p_dst_mac, 1))
> +-		goto no_option;
> +-
> + 	return fd;
> + no_option:
> + 	close(fd);
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
002-port-Add-dataset_comparison-type-IEC62439-3.patch b/meta-arago-distro=
/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-dataset_comparison-=
type-IEC62439-3.patch
> new file mode 100644
> index 00000000..c6405ae0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-por=
t-Add-dataset_comparison-type-IEC62439-3.patch
> @@ -0,0 +1,217 @@
> +From 43a4a63b8c64993ef8662035e86d4805923eb6cc Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 18 Sep 2025 12:58:52 +0200
> +Subject: [PATCH 02/13] port: Add dataset_comparison type IEC62439-3
> +
> +For IEC62439-3 the clock comparison is mostly the same as with IEEE158=
8.
> +The specification adds an additional comparison step if both messages
> +(from the same master) are identical. The suggestion is to use for
> +instance the port with the smaller value in the correction field but
> +also don't flip between the two ports if port with the smaller
> +correction value changes frequently.
> +
> +Instead pick the first port, and stay with it.
> +Use this dataset_comparison field to:
> +- Make the clock aware that it is in a DAC (doubly attached mode)
> +- Check for two interfaces
> +- Check that the interfaces belong to the same PTP clock domain. Not
> +  strictly required but makes it easier. Otherwise the manual
> +  synchronisation of the two clocks is required.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00008.h=
tml
> +
> + bmc.h    |  1 +
> + clock.c  | 45 +++++++++++++++++++++++++++++++++++++++++++--
> + clock.h  |  7 +++++++
> + config.c |  1 +
> + ptp4l.8  |  4 ++--
> + ptp4l.c  | 13 ++++++++++++-
> + 6 files changed, 66 insertions(+), 5 deletions(-)
> +
> +diff --git a/bmc.h b/bmc.h
> +index 413d907..b59a234 100644
> +--- a/bmc.h
> ++++ b/bmc.h
> +@@ -32,6 +32,7 @@
> + enum {
> + 	DS_CMP_IEEE1588,
> + 	DS_CMP_G8275,
> ++	DS_CMP_IEC62439_3,
> + };
> +=20
> + /**
> +diff --git a/clock.c b/clock.c
> +index 17484d8..40c21ec 100644
> +--- a/clock.c
> ++++ b/clock.c
> +@@ -151,6 +151,7 @@ struct clock {
> + 	struct time_zone tz[MAX_TIME_ZONES];
> + 	struct ClockIdentity ext_gm_identity;
> + 	int ext_gm_steps_removed;
> ++	bool use_DAC;
> + };
> +=20
> + struct clock the_clock;
> +@@ -1389,11 +1390,26 @@ struct clock *clock_create(enum clock_type typ=
e, struct config *config,
> + 	}
> + 	c->servo_state =3D SERVO_UNLOCKED;
> + 	c->servo_type =3D servo;
> +-	if (config_get_int(config, NULL, "dataset_comparison") =3D=3D DS_CMP=
_G8275) {
> ++
> ++	switch (config_get_int(config, NULL, "dataset_comparison")) {
> ++	case DS_CMP_IEEE1588:
> ++		c->dscmp =3D dscmp;
> ++		break;
> ++
> ++	case DS_CMP_G8275:
> + 		c->dscmp =3D telecom_dscmp;
> +-	} else {
> ++		break;
> ++
> ++	case DS_CMP_IEC62439_3:
> + 		c->dscmp =3D dscmp;
> ++		c->use_DAC =3D true;
> ++		break;
> ++
> ++	default:
> ++		pr_err("Bad dataset_comparison");
> ++		return NULL;
> + 	}
> ++
> + 	c->tsproc =3D tsproc_create(config_get_int(config, NULL, "tsproc_mod=
e"),
> + 				  config_get_int(config, NULL, "delay_filter"),
> + 				  config_get_int(config, NULL, "delay_filter_length"));
> +@@ -1475,6 +1491,26 @@ struct clock *clock_create(enum clock_type type=
, struct config *config,
> + 		return NULL;
> + 	}
> +=20
> ++	if (c->use_DAC) {
> ++		int phc_idx;
> ++
> ++		iface =3D STAILQ_FIRST(&config->interfaces);
> ++		if (interface_tsinfo_valid(iface)) {
> ++			phc_idx =3D interface_phc_index(iface);
> ++
> ++			STAILQ_FOREACH(iface, &config->interfaces, list) {
> ++				if (interface_tsinfo_valid(iface)) {
> ++					if (interface_phc_index(iface) !=3D phc_idx) {
> ++						pr_err("The network devices not share the PMC\n");
> ++					}
> ++				} else {
> ++					pr_err("Could not verify PHC device of the network devices\n");
> ++				}
> ++			}
> ++		} else {
> ++			pr_err("Could not verify PHC device of the network devices\n");
> ++		}
> ++	}
> + 	/* Create the ports. */
> + 	STAILQ_FOREACH(iface, &config->interfaces, list) {
> + 		if (clock_add_port(c, phc_device, phc_index, timestamping, iface)) =
{
> +@@ -2359,6 +2395,11 @@ enum clock_type clock_type(struct clock *c)
> + 	return c->type;
> + }
> +=20
> ++bool clock_type_is_DAC(struct clock *c)
> ++{
> ++	return c->use_DAC;
> ++}
> ++
> + void clock_check_ts(struct clock *c, uint64_t ts)
> + {
> + 	if (c->sanity_check && clockcheck_sample(c->sanity_check, ts)) {
> +diff --git a/clock.h b/clock.h
> +index ce9ae91..5d410b3 100644
> +--- a/clock.h
> ++++ b/clock.h
> +@@ -382,6 +382,13 @@ struct clock_description *clock_description(struc=
t clock *c);
> +  */
> + enum clock_type clock_type(struct clock *c);
> +=20
> ++/**
> ++ * Check if the clock is doubly attached clock.
> ++ * @param c  The clock instance.
> ++ * @return   True if the clock is DAC, false otherwise.
> ++ */
> ++bool clock_type_is_DAC(struct clock *c);
> ++
> + /**
> +  * Perform a sanity check on a time stamp made by a clock.
> +  * @param c  The clock instance.
> +diff --git a/config.c b/config.c
> +index 222f4cd..6f4fd9c 100644
> +--- a/config.c
> ++++ b/config.c
> +@@ -176,6 +176,7 @@ static struct config_enum clock_type_enu[] =3D {
> + static struct config_enum dataset_comp_enu[] =3D {
> + 	{ "ieee1588", DS_CMP_IEEE1588 },
> + 	{ "G.8275.x", DS_CMP_G8275    },
> ++	{ "IEC62439-3", DS_CMP_IEC62439_3},
> + 	{ NULL, 0 },
> + };
> +=20
> +diff --git a/ptp4l.8 b/ptp4l.8
> +index 6e3f456..dd40731 100644
> +--- a/ptp4l.8
> ++++ b/ptp4l.8
> +@@ -657,8 +657,8 @@ The default is "OC".
> + .TP
> + .B dataset_comparison
> + Specifies the method to be used when comparing data sets during the
> +-Best Master Clock Algorithm.  The possible values are "ieee1588" and
> +-"G.8275.x".  The default is "ieee1588".
> ++Best Master Clock Algorithm.  The possible values are "ieee1588",
> ++"G.8275.x" and "IEC62439-3". The default is "ieee1588".
> +=20
> + .TP
> + .B domainNumber
> +diff --git a/ptp4l.c b/ptp4l.c
> +index ac2ef96..10b8962 100644
> +--- a/ptp4l.c
> ++++ b/ptp4l.c
> +@@ -23,6 +23,7 @@
> + #include <string.h>
> + #include <unistd.h>
> +=20
> ++#include "bmc.h"
> + #include "clock.h"
> + #include "config.h"
> + #include "ntpshm.h"
> +@@ -75,6 +76,7 @@ int main(int argc, char *argv[])
> + 	enum clock_type type =3D CLOCK_TYPE_ORDINARY;
> + 	int c, err =3D -1, index, cmd_line_print_level;
> + 	struct clock *clock =3D NULL;
> ++	bool use_DAC =3D false;
> + 	struct option *opts;
> + 	struct config *cfg;
> +=20
> +@@ -211,10 +213,19 @@ int main(int argc, char *argv[])
> + 		goto out;
> + 	}
> +=20
> ++	if (config_get_int(cfg, NULL, "dataset_comparison") =3D=3D DS_CMP_IE=
C62439_3) {
> ++		use_DAC =3D true;
> ++	}
> ++
> + 	type =3D config_get_int(cfg, NULL, "clock_type");
> + 	switch (type) {
> + 	case CLOCK_TYPE_ORDINARY:
> +-		if (cfg->n_interfaces > 1) {
> ++		if (use_DAC) {
> ++			if (cfg->n_interfaces !=3D 2) {
> ++				fprintf(stderr, "IEC62439-3 dataset comparison requires two inter=
faces\n");
> ++				goto out;
> ++			}
> ++		} else if (cfg->n_interfaces > 1) {
> + 			type =3D CLOCK_TYPE_BOUNDARY;
> + 		}
> + 		break;
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
003-Add-PASSIVE_SLAVE-state.patch b/meta-arago-distro/recipes-connectivit=
y/linuxptp/linuxptp/0003-Add-PASSIVE_SLAVE-state.patch
> new file mode 100644
> index 00000000..c65d7471
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add=
-PASSIVE_SLAVE-state.patch
> @@ -0,0 +1,275 @@
> +From b79ffcdde80fe7f464b00a2fd20f6c587ab6e4ab Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:09:32 +0200
> +Subject: [PATCH 03/13] Add PASSIVE_SLAVE state.
> +
> +Add PASSIVE_SLAVE which is defined in IEC 62439-3 as an extension to I=
EC
> +61588. It also renames PASSIVE to PASSIVE_MASTER for clarity but lets
> +ignore this part.
> +
> +The PASSIVE_SLAVE acts as SLAVE but does not participate in clock
> +adjustments. It will send Delay_Req or Pdelay_Req and respond to those
> +packets.
> +In management interface the PASSIVE_SLAVE should be exposed as SLAVE.
> +
> +Add PS_PASSIVE_SLAVE to port_state and EV_RS_PSLAVE to fsm_event. Upda=
te
> +existing state engines to avoid "unhandled switch case".
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00009.h=
tml
> +
> + clock.c           |  3 +++
> + e2e_tc.c          |  2 ++
> + fsm.c             |  3 +++
> + fsm.h             |  2 ++
> + p2p_tc.c          |  4 ++++
> + port.c            | 14 ++++++++++++--
> + port_signaling.c  |  1 +
> + tc.c              |  2 ++
> + unicast_service.c |  1 +
> + util.c            |  2 ++
> + 10 files changed, 32 insertions(+), 2 deletions(-)
> +
> +diff --git a/clock.c b/clock.c
> +index 40c21ec..d777378 100644
> +--- a/clock.c
> ++++ b/clock.c
> +@@ -2373,6 +2373,9 @@ static void handle_state_decision_event(struct c=
lock *c)
> + 			clock_update_slave(c);
> + 			event =3D EV_RS_SLAVE;
> + 			break;
> ++		case PS_PASSIVE_SLAVE:
> ++			event =3D EV_RS_PSLAVE;
> ++			break;
> + 		default:
> + 			event =3D EV_FAULT_DETECTED;
> + 			break;
> +diff --git a/e2e_tc.c b/e2e_tc.c
> +index 82b454a..53cf4eb 100644
> +--- a/e2e_tc.c
> ++++ b/e2e_tc.c
> +@@ -75,6 +75,8 @@ void e2e_dispatch(struct port *p, enum fsm_event eve=
nt, int mdiff)
> + 	case PS_SLAVE:
> + 		port_set_announce_tmo(p);
> + 		break;
> ++	case PS_PASSIVE_SLAVE:
> ++		break;
> + 	};
> + }
> +=20
> +diff --git a/fsm.c b/fsm.c
> +index ce6efad..9e8c4d8 100644
> +--- a/fsm.c
> ++++ b/fsm.c
> +@@ -214,6 +214,9 @@ enum port_state ptp_fsm(enum port_state state, enu=
m fsm_event event, int mdiff)
> + 			break;
> + 		}
> + 		break;
> ++
> ++	case PS_PASSIVE_SLAVE:
> ++		break;
> + 	}
> +=20
> + 	return next;
> +diff --git a/fsm.h b/fsm.h
> +index 857af05..e07d9a9 100644
> +--- a/fsm.h
> ++++ b/fsm.h
> +@@ -31,6 +31,7 @@ enum port_state {
> + 	PS_PASSIVE,
> + 	PS_UNCALIBRATED,
> + 	PS_SLAVE,
> ++	PS_PASSIVE_SLAVE, /* Added to IEC 61588:2021, Table 27 (via 62439-3)=
 */
> + 	PS_GRAND_MASTER, /*non-standard extension*/
> + };
> +=20
> +@@ -53,6 +54,7 @@ enum fsm_event {
> + 	EV_RS_GRAND_MASTER,
> + 	EV_RS_SLAVE,
> + 	EV_RS_PASSIVE,
> ++	EV_RS_PSLAVE,
> + };
> +=20
> + enum bmca_select {
> +diff --git a/p2p_tc.c b/p2p_tc.c
> +index a8ec63b..7fda10e 100644
> +--- a/p2p_tc.c
> ++++ b/p2p_tc.c
> +@@ -40,6 +40,8 @@ static int p2p_delay_request(struct port *p)
> + 	case PS_SLAVE:
> + 	case PS_GRAND_MASTER:
> + 		break;
> ++	case PS_PASSIVE_SLAVE:
> ++		break;
> + 	}
> + 	return port_delay_request(p);
> + }
> +@@ -92,6 +94,8 @@ void p2p_dispatch(struct port *p, enum fsm_event eve=
nt, int mdiff)
> + 	case PS_SLAVE:
> + 		port_set_announce_tmo(p);
> + 		break;
> ++	case PS_PASSIVE_SLAVE:
> ++		break;
> + 	};
> + }
> +=20
> +diff --git a/port.c b/port.c
> +index a1d0f2c..549d72b 100644
> +--- a/port.c
> ++++ b/port.c
> +@@ -1023,6 +1023,8 @@ static int port_management_fill_response(struct =
port *target,
> + 		pds->portIdentity            =3D target->portIdentity;
> + 		if (target->state =3D=3D PS_GRAND_MASTER) {
> + 			pds->portState =3D PS_MASTER;
> ++		} else if (target->state =3D=3D PS_PASSIVE_SLAVE) {
> ++			pds->portState =3D PS_SLAVE;
> + 		} else {
> + 			pds->portState =3D target->state;
> + 		}
> +@@ -1089,6 +1091,8 @@ static int port_management_fill_response(struct =
port *target,
> + 		ppn->portIdentity =3D target->portIdentity;
> + 		if (target->state =3D=3D PS_GRAND_MASTER)
> + 			ppn->port_state =3D PS_MASTER;
> ++		else if (target->state =3D=3D PS_PASSIVE_SLAVE)
> ++			ppn->port_state =3D PS_SLAVE;
> + 		else
> + 			ppn->port_state =3D target->state;
> + 		ppn->timestamping =3D target->timestamping;
> +@@ -1922,6 +1926,7 @@ int port_is_enabled(struct port *p)
> + 	case PS_PASSIVE:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		break;
> + 	}
> + 	return 1;
> +@@ -2242,6 +2247,7 @@ int process_announce(struct port *p, struct ptp_=
message *m)
> + 	case PS_PASSIVE:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		result =3D update_current_master(p, m);
> + 		break;
> + 	}
> +@@ -2289,7 +2295,7 @@ static int process_cmlds(struct port *p)
> + 		p->nrate.ratio =3D 1.0 + (double) cmlds->scaledNeighborRateRatio / =
POW2_41;
> + 		p->asCapable =3D cmlds->as_capable;
> + 		p->cmlds.timer_count =3D 0;
> +-		if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE) {
> ++		if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE || =
p->state =3D=3D PS_PASSIVE_SLAVE) {
> + 			const tmv_t tx =3D tmv_zero();
> + 			clock_peer_delay(p->clock, p->peer_delay, tx, tx, p->nrate.ratio);
> + 		}
> +@@ -2437,6 +2443,7 @@ void process_follow_up(struct port *p, struct pt=
p_message *m)
> + 	case PS_MASTER:
> + 	case PS_GRAND_MASTER:
> + 	case PS_PASSIVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		return;
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> +@@ -2668,7 +2675,7 @@ calc:
> +=20
> + 	p->peerMeanPathDelay =3D tmv_to_TimeInterval(p->peer_delay);
> +=20
> +-	if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE) {
> ++	if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE || p=
->state =3D=3D PS_PASSIVE_SLAVE) {
> + 		clock_peer_delay(p->clock, p->peer_delay, t1, t2,
> + 				 p->nrate.ratio);
> + 	}
> +@@ -2752,6 +2759,7 @@ void process_sync(struct port *p, struct ptp_mes=
sage *m)
> + 	case PS_MASTER:
> + 	case PS_GRAND_MASTER:
> + 	case PS_PASSIVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		return;
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> +@@ -2895,6 +2903,7 @@ static void port_e2e_transition(struct port *p, =
enum port_state next)
> + 		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
> + 		/* fall through */
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		port_set_announce_tmo(p);
> + 		port_set_delay_tmo(p);
> + 		break;
> +@@ -2943,6 +2952,7 @@ static void port_p2p_transition(struct port *p, =
enum port_state next)
> + 		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
> + 		/* fall through */
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		port_set_announce_tmo(p);
> + 		break;
> + 	};
> +diff --git a/port_signaling.c b/port_signaling.c
> +index cf28756..fb42fe6 100644
> +--- a/port_signaling.c
> ++++ b/port_signaling.c
> +@@ -147,6 +147,7 @@ int process_signaling(struct port *p, struct ptp_m=
essage *m)
> + 	case PS_PASSIVE:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		break;
> + 	}
> +=20
> +diff --git a/tc.c b/tc.c
> +index 27ba66f..0fd1bc4 100644
> +--- a/tc.c
> ++++ b/tc.c
> +@@ -88,6 +88,7 @@ static int tc_blocked(struct port *q, struct port *p=
, struct ptp_message *m)
> + 		break;
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		break;
> + 	}
> + 	/* Egress state */
> +@@ -102,6 +103,7 @@ static int tc_blocked(struct port *q, struct port =
*p, struct ptp_message *m)
> + 		return 1;
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		/* Delay_Req swims against the stream. */
> + 		if (msg_type(m) !=3D DELAY_REQ) {
> + 			return 1;
> +diff --git a/unicast_service.c b/unicast_service.c
> +index d7a4ecd..7b5196b 100644
> +--- a/unicast_service.c
> ++++ b/unicast_service.c
> +@@ -532,6 +532,7 @@ int unicast_service_timer(struct port *p)
> + 	case PS_PASSIVE:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> + 		break;
> + 	case PS_MASTER:
> + 	case PS_GRAND_MASTER:
> +diff --git a/util.c b/util.c
> +index 4e9263b..4deebe8 100644
> +--- a/util.c
> ++++ b/util.c
> +@@ -60,6 +60,7 @@ const char *ps_str[] =3D {
> + 	"PASSIVE",
> + 	"UNCALIBRATED",
> + 	"SLAVE",
> ++	"PASSIVE_SLAVE",
> + 	"GRAND_MASTER",
> + };
> +=20
> +@@ -81,6 +82,7 @@ const char *ev_str[] =3D {
> + 	"RS_GRAND_MASTER",
> + 	"RS_SLAVE",
> + 	"RS_PASSIVE",
> ++	"RS_PASSIVE_SLAVE",
> + };
> +=20
> + const char *ts_str(enum timestamp_type ts)
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
004-rtnl-Add-rtnl_get_hsr_devices.patch b/meta-arago-distro/recipes-conne=
ctivity/linuxptp/linuxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
> new file mode 100644
> index 00000000..2b238acc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtn=
l-Add-rtnl_get_hsr_devices.patch
> @@ -0,0 +1,120 @@
> +From 0dc4e53ae6fb958c5d04108d8511e25cbf3aabfb Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Wed, 22 Oct 2025 15:32:22 +0200
> +Subject: [PATCH 04/13] rtnl: Add rtnl_get_hsr_devices()
> +
> +Extend rtnl_linkinfo_parse() by supporting HSR. It will return the
> +two interface numbers in one 32bit int by using the lower 16bit for
> +slave1 and the upper 16bit for slave2.
> +
> +Provide rtnl_get_hsr_devices() which uses it and returns the resolved
> +interface name.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00014.h=
tml
> +
> + rtnl.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
> + rtnl.h |  9 +++++++++
> + 2 files changed, 60 insertions(+)
> +
> +diff --git a/rtnl.c b/rtnl.c
> +index 1037c44..2e377ae 100644
> +--- a/rtnl.c
> ++++ b/rtnl.c
> +@@ -207,6 +207,7 @@ static int rtnl_linkinfo_parse(int master_index, s=
truct rtattr *rta)
> + {
> + 	struct rtattr *linkinfo[IFLA_INFO_MAX+1];
> + 	struct rtattr *bond[IFLA_BOND_MAX+1];
> ++	struct rtattr *hsr[IFLA_HSR_MAX+1];
> + 	int index =3D -1;
> + 	char *kind;
> +=20
> +@@ -227,6 +228,24 @@ static int rtnl_linkinfo_parse(int master_index, =
struct rtattr *rta)
> + 			}
> + 		} else if (kind && !strncmp(kind, "team", 4)) {
> + 			index =3D get_team_active_iface(master_index);
> ++
> ++		} else if (kind && !strncmp(kind, "hsr", 3) &&
> ++			   linkinfo[IFLA_INFO_DATA]) {
> ++			unsigned int slave1, slave2;
> ++
> ++			if (rtnl_nested_rtattr_parse(hsr, IFLA_HSR_MAX,
> ++						     linkinfo[IFLA_INFO_DATA]) < 0)
> ++				return -1;
> ++
> ++			if (!hsr[IFLA_HSR_SLAVE1] || !hsr[IFLA_HSR_SLAVE2])
> ++				return -1;
> ++
> ++			slave1 =3D rta_getattr_u32(hsr[IFLA_HSR_SLAVE1]);
> ++			slave2 =3D rta_getattr_u32(hsr[IFLA_HSR_SLAVE2]);
> ++
> ++			if (slave1 > 0xffff || slave2 > 0xffff)
> ++				return -1;
> ++			index =3D slave1 | slave2 << 16;
> + 		}
> + 	}
> + 	return index;
> +@@ -552,3 +571,35 @@ no_info:
> + 	nl_close(fd);
> + 	return ret;
> + }
> ++
> ++int rtnl_get_hsr_devices(const char *hsr_device, char slaveA[IF_NAMES=
IZE], char slaveB[IF_NAMESIZE])
> ++{
> ++	int err, fd;
> ++	unsigned int hsr_slaves =3D 0;
> ++
> ++	fd =3D rtnl_open();
> ++	if (fd < 0)
> ++		return fd;
> ++
> ++	err =3D rtnl_link_query(fd, hsr_device);
> ++	if (err) {
> ++		goto no_info;
> ++	}
> ++	err =3D -1;
> ++
> ++	rtnl_link_status(fd, hsr_device, rtnl_get_ts_device_callback, &hsr_s=
laves);
> ++	if (hsr_slaves =3D=3D 0)
> ++		goto no_info;
> ++
> ++	if (!if_indextoname(hsr_slaves & 0xffff, slaveA))
> ++		goto no_info;
> ++
> ++	if (!if_indextoname(hsr_slaves >> 16, slaveB))
> ++		goto no_info;
> ++
> ++	err =3D 0;
> ++
> ++no_info:
> ++	rtnl_close(fd);
> ++	return err;
> ++}
> +diff --git a/rtnl.h b/rtnl.h
> +index 96fee29..d10db32 100644
> +--- a/rtnl.h
> ++++ b/rtnl.h
> +@@ -68,6 +68,15 @@ int rtnl_link_status(int fd, const char *device, rt=
nl_callback cb, void *ctx);
> +  */
> + int rtnl_iface_has_vclock(const char *device, int phc_index);
> +=20
> ++/**
> ++ * Return both slave portts of a HSR device.
> ++ * param device	The name of the HSR deviec
> ++ * @param slaveA	The name of the SlaveA device
> ++ * @param slaveB	The name of the SlaveB device
> ++ * @return		Zero on success, non-zero otherwise.
> ++ */
> ++int rtnl_get_hsr_devices(const char *hsr_device, char slaveA[IF_NAMES=
IZE], char slaveB[IF_NAMESIZE]);
> ++
> + /**
> +  * Open a RT netlink socket for monitoring link state.
> +  * @return    A valid socket, or -1 on error.
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
005-port-Add-paired_port-option.patch b/meta-arago-distro/recipes-connect=
ivity/linuxptp/linuxptp/0005-port-Add-paired_port-option.patch
> new file mode 100644
> index 00000000..22265db7
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-por=
t-Add-paired_port-option.patch
> @@ -0,0 +1,175 @@
> +From 6817d7ab3549a59d55fe6de888e2ee7e72c6c8c9 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:34:10 +0200
> +Subject: [PATCH 05/13] port: Add paired_port option.
> +
> +Add an option to pair ports. This is for a HSR network to find the oth=
er
> +port.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00010.h=
tml
> +
> + clock.c        |  1 +
> + config.c       |  1 +
> + makefile       |  2 +-
> + port.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> + port.h         | 15 +++++++++++++++
> + port_private.h |  1 +
> + ptp4l.8        |  4 ++++
> + 7 files changed, 71 insertions(+), 1 deletion(-)
> +
> +diff --git a/clock.c b/clock.c
> +index d777378..b628c34 100644
> +--- a/clock.c
> ++++ b/clock.c
> +@@ -1051,6 +1051,7 @@ static int clock_add_port(struct clock *c, const=
 char *phc_device,
> + 		return -1;
> + 	}
> + 	LIST_FOREACH(piter, &c->ports, list) {
> ++		port_pair_redundant_ports(p, piter);
> + 		lastp =3D piter;
> + 	}
> + 	if (lastp) {
> +diff --git a/config.c b/config.c
> +index 6f4fd9c..a882bc7 100644
> +--- a/config.c
> ++++ b/config.c
> +@@ -293,6 +293,7 @@ struct config_item config_tab[] =3D {
> + 	GLOB_ITEM_INT("G.8275.defaultDS.localPriority", 128, 1, UINT8_MAX),
> + 	PORT_ITEM_INT("G.8275.portDS.localPriority", 128, 1, UINT8_MAX),
> + 	GLOB_ITEM_INT("gmCapable", 1, 0, 1),
> ++	PORT_ITEM_STR("hsr_device", ""),
> + 	GLOB_ITEM_ENU("hwts_filter", HWTS_FILTER_NORMAL, hwts_filter_enu),
> + 	PORT_ITEM_INT("hybrid_e2e", 0, 0, 1),
> + 	PORT_ITEM_INT("ignore_source_id", 0, 0, 1),
> +diff --git a/makefile b/makefile
> +index 07199aa..50c2d5a 100644
> +--- a/makefile
> ++++ b/makefile
> +@@ -26,7 +26,7 @@ PRG	=3D ptp4l hwstamp_ctl nsm phc2sys phc_ctl pmc ti=
memaster ts2phc tz2alt
> + SECURITY =3D sad.o
> + FILTERS	=3D filter.o mave.o mmedian.o
> + SERVOS	=3D linreg.o ntpshm.o nullf.o pi.o refclock_sock.o servo.o
> +-TRANSP	=3D raw.o transport.o udp.o udp6.o uds.o
> ++TRANSP	=3D raw.o transport.o udp.o udp6.o uds.o rtnl.o
> + TS2PHC	=3D ts2phc.o lstab.o nmea.o serial.o sock.o ts2phc_generic_pps=
_source.o \
> +  ts2phc_nmea_pps_source.o ts2phc_phc_pps_source.o ts2phc_pps_sink.o t=
s2phc_pps_source.o
> + OBJ	=3D bmc.o clock.o clockadj.o clockcheck.o config.o designated_fsm=
.o \
> +diff --git a/port.c b/port.c
> +index 549d72b..586e365 100644
> +--- a/port.c
> ++++ b/port.c
> +@@ -3793,6 +3793,54 @@ err_port:
> + 	return NULL;
> + }
> +=20
> ++void port_pair_redundant_ports(struct port *p1, struct port *p2)
> ++{
> ++	const char *p1_name =3D interface_name(p1->iface);
> ++	const char *p2_name =3D interface_name(p2->iface);
> ++	const char *p1_hsr, *p2_hsr;
> ++	struct config *cfg;
> ++	char hsr_slave_A[IF_NAMESIZE];
> ++	char hsr_slave_B[IF_NAMESIZE];
> ++	int ret;
> ++
> ++	cfg =3D clock_config(p1->clock);
> ++
> ++	/* Do the two ports belong to the same hsr device? */
> ++	p1_hsr =3D config_get_string(cfg, p1_name, "hsr_device");
> ++	if (!strlen(p1_hsr))
> ++		return;
> ++
> ++	p2_hsr =3D config_get_string(cfg, p2_name, "hsr_device");
> ++	if (strcmp(p1_hsr, p2_hsr))
> ++		return;
> ++
> ++	ret =3D rtnl_get_hsr_devices(p1_hsr, hsr_slave_A, hsr_slave_B);
> ++	if (ret) {
> ++		pr_err("Failed to query HSR attributes on %s", p1_hsr);
> ++		return;
> ++	}
> ++
> ++	if (!strcmp(hsr_slave_A, p1_name) && !strcmp(hsr_slave_B, p2_name)) =
{
> ++		p1->paired_port =3D p2;
> ++		p2->paired_port =3D p1;
> ++	} else if (!strcmp(hsr_slave_A, p2_name) && !strcmp(hsr_slave_B, p1_=
name)) {
> ++		p1->paired_port =3D p2;
> ++		p2->paired_port =3D p1;
> ++	} else {
> ++		pr_err("On HSR dev %s ports %s/%s don't match %s/%s\n",
> ++		       p1_hsr, hsr_slave_A, hsr_slave_B, p1_name, p2_name);
> ++		return;
> ++	}
> ++
> ++	pr_notice("Pairing redundant ports %s and %s on %s.",
> ++		  p1_name, p2_name, p1_hsr);
> ++}
> ++
> ++struct port *port_paired_port(struct port *port)
> ++{
> ++	return port->paired_port;
> ++}
> ++
> + enum port_state port_state(struct port *port)
> + {
> + 	return port->state;
> +diff --git a/port.h b/port.h
> +index cc03859..f103006 100644
> +--- a/port.h
> ++++ b/port.h
> +@@ -366,4 +366,19 @@ void tc_cleanup(void);
> +  */
> + void port_update_unicast_state(struct port *p);
> +=20
> ++/**
> ++ * Pair two ports which are redundant (as per HSR)
> ++ *
> ++ * @param p1  A port instance.
> ++ * @param p2  A port instance.
> ++ */
> ++void port_pair_redundant_ports(struct port *p1, struct port *p2);
> ++
> ++/**
> ++ * Return the paired (rundant port) of this port instance (as per HSR=
)
> ++ *
> ++ * @param port  A port instance.
> ++ */
> ++struct port *port_paired_port(struct port *port);
> ++
> + #endif
> +diff --git a/port_private.h b/port_private.h
> +index aa9a095..79b1d31 100644
> +--- a/port_private.h
> ++++ b/port_private.h
> +@@ -174,6 +174,7 @@ struct port {
> + 		int port;
> + 	} cmlds;
> + 	struct ProfileIdentity profileIdentity;
> ++	struct port *paired_port;
> + };
> +=20
> + #define portnum(p) (p->portIdentity.portNumber)
> +diff --git a/ptp4l.8 b/ptp4l.8
> +index dd40731..c8c00ef 100644
> +--- a/ptp4l.8
> ++++ b/ptp4l.8
> +@@ -754,6 +754,10 @@ The server sends its interface rate using interfa=
ce rate TLV
> + as per G.8275.2 Annex D.
> + The default is 0 (does not support interface rate tlv).
> +=20
> ++.TP
> ++.B hsr_device
> ++If the device belongs to the hsr network, specifiy the HSR parent. De=
fault is empty.
> ++
> + .TP
> + .B hwts_filter
> + Select the hardware time stamp filter setting mode.
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
006-fsm-Add-a-state-engine-for-redundant-master.patch b/meta-arago-distro=
/recipes-connectivity/linuxptp/linuxptp/0006-fsm-Add-a-state-engine-for-r=
edundant-master.patch
> new file mode 100644
> index 00000000..dd94c963
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm=
-Add-a-state-engine-for-redundant-master.patch
> @@ -0,0 +1,519 @@
> +From 52baa3911eb6e7a103b6de6f4c2adf964ab4fca3 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:37:06 +0200
> +Subject: [PATCH 06/13] fsm: Add a state engine for redundant master
> +
> +The FSM ptp_red_m_fsm() and ptp_red_slave_fsm() (slave only) are based
> +on ptp_fsm() and ptp_slave_fsm() but add the additional PASSIVE_SLAVE
> +handling.
> +This state machine is selected once redundant_master has been specifie=
d
> +for the bmca option.
> +
> +The bmc_state_decision() will return PASSIVE_SLAVE if a redundant port
> +is available and has the best clock.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00016.h=
tml
> +
> + bmc.c    |   6 +
> + config.c |   1 +
> + fsm.c    | 395 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+
> + fsm.h    |  19 +++
> + port.c   |   2 +
> + 5 files changed, 423 insertions(+)
> +
> +diff --git a/bmc.c b/bmc.c
> +index ebc0789..5ce0b0c 100644
> +--- a/bmc.c
> ++++ b/bmc.c
> +@@ -130,6 +130,7 @@ enum port_state bmc_state_decision(struct clock *c=
, struct port *r,
> + 				   int (*compare)(struct dataset *a, struct dataset *b))
> + {
> + 	struct dataset *clock_ds, *clock_best, *port_best;
> ++	struct port *paired_port;
> + 	enum port_state ps;
> +=20
> + 	clock_ds =3D clock_default_ds(c);
> +@@ -167,6 +168,11 @@ enum port_state bmc_state_decision(struct clock *=
c, struct port *r,
> + 		return PS_SLAVE; /*S1*/
> + 	}
> +=20
> ++	paired_port =3D port_paired_port(r);
> ++	if (paired_port && clock_best_port(c) =3D=3D paired_port) {
> ++		return PS_PASSIVE_SLAVE;
> ++	}
> ++
> + 	if (compare(clock_best, port_best) =3D=3D A_BETTER_TOPO) {
> + 		return PS_PASSIVE; /*P2*/
> + 	} else {
> +diff --git a/config.c b/config.c
> +index a882bc7..4cdb37f 100644
> +--- a/config.c
> ++++ b/config.c
> +@@ -249,6 +249,7 @@ static struct config_enum as_capable_enu[] =3D {
> + static struct config_enum bmca_enu[] =3D {
> + 	{ "ptp",  BMCA_PTP  },
> + 	{ "noop", BMCA_NOOP },
> ++	{ "redundant_master", BMCA_RED_MASTER },
> + 	{ NULL, 0 },
> + };
> +=20
> +diff --git a/fsm.c b/fsm.c
> +index 9e8c4d8..af72fea 100644
> +--- a/fsm.c
> ++++ b/fsm.c
> +@@ -338,3 +338,398 @@ enum port_state ptp_slave_fsm(enum port_state st=
ate, enum fsm_event event,
> +=20
> + 	return next;
> + }
> ++
> ++enum port_state ptp_red_m_fsm(enum port_state state, enum fsm_event e=
vent, int mdiff)
> ++{
> ++	enum port_state next =3D state;
> ++
> ++	if (EV_INITIALIZE =3D=3D event || EV_POWERUP =3D=3D event)
> ++		return PS_INITIALIZING;
> ++
> ++	switch (state) {
> ++	case PS_INITIALIZING:
> ++		switch (event) {
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_INIT_COMPLETE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_FAULTY:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_CLEARED:
> ++			next =3D PS_INITIALIZING;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_DISABLED:
> ++		if (EV_DESIGNATED_ENABLED =3D=3D event)
> ++			next =3D PS_INITIALIZING;
> ++		break;
> ++
> ++	case PS_LISTENING:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_RS_MASTER:
> ++			next =3D PS_PRE_MASTER;
> ++			break;
> ++		case EV_RS_GRAND_MASTER:
> ++			next =3D PS_GRAND_MASTER;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_PASSIVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_PRE_MASTER:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_QUALIFICATION_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_PASSIVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_MASTER:
> ++	case PS_GRAND_MASTER:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_PASSIVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_PASSIVE:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_RS_MASTER:
> ++			next =3D PS_PRE_MASTER;
> ++			break;
> ++		case EV_RS_GRAND_MASTER:
> ++			next =3D PS_GRAND_MASTER;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_UNCALIBRATED:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_MASTER_CLOCK_SELECTED:
> ++			next =3D PS_SLAVE;
> ++			break;
> ++		case EV_RS_MASTER:
> ++			next =3D PS_PRE_MASTER;
> ++			break;
> ++		case EV_RS_GRAND_MASTER:
> ++			next =3D PS_GRAND_MASTER;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_PASSIVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_SLAVE:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_SYNCHRONIZATION_FAULT:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_MASTER:
> ++			next =3D PS_PRE_MASTER;
> ++			break;
> ++		case EV_RS_GRAND_MASTER:
> ++			next =3D PS_GRAND_MASTER;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			if (mdiff)
> ++				next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_PASSIVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_PASSIVE_SLAVE:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_RS_MASTER:
> ++		case EV_RS_GRAND_MASTER:
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++			next =3D PS_MASTER;
> ++			break;
> ++		case EV_NONE:
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++	}
> ++
> ++	return next;
> ++}
> ++
> ++enum port_state ptp_red_slave_fsm(enum port_state state, enum fsm_eve=
nt event,
> ++				  int mdiff)
> ++{
> ++	enum port_state next =3D state;
> ++
> ++	if (EV_INITIALIZE =3D=3D event || EV_POWERUP =3D=3D event)
> ++		return PS_INITIALIZING;
> ++
> ++	switch (state) {
> ++	case PS_INITIALIZING:
> ++		switch (event) {
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_INIT_COMPLETE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_FAULTY:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_CLEARED:
> ++			next =3D PS_INITIALIZING;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_DISABLED:
> ++		if (EV_DESIGNATED_ENABLED =3D=3D event)
> ++			next =3D PS_INITIALIZING;
> ++		break;
> ++
> ++	case PS_LISTENING:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++		case EV_RS_MASTER:
> ++		case EV_RS_GRAND_MASTER:
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_UNCALIBRATED:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++		case EV_RS_MASTER:
> ++		case EV_RS_GRAND_MASTER:
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		case EV_MASTER_CLOCK_SELECTED:
> ++			next =3D PS_SLAVE;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_SLAVE:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++		case EV_RS_MASTER:
> ++		case EV_RS_GRAND_MASTER:
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		case EV_SYNCHRONIZATION_FAULT:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			if (mdiff)
> ++				next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	case PS_PASSIVE_SLAVE:
> ++		switch (event) {
> ++		case EV_DESIGNATED_DISABLED:
> ++			next =3D PS_DISABLED;
> ++			break;
> ++		case EV_FAULT_DETECTED:
> ++			next =3D PS_FAULTY;
> ++			break;
> ++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
> ++		case EV_RS_MASTER:
> ++		case EV_RS_GRAND_MASTER:
> ++		case EV_RS_PASSIVE:
> ++			next =3D PS_LISTENING;
> ++			break;
> ++		case EV_SYNCHRONIZATION_FAULT:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_SLAVE:
> ++			next =3D PS_UNCALIBRATED;
> ++			break;
> ++		case EV_RS_PSLAVE:
> ++			next =3D PS_PASSIVE_SLAVE;
> ++			break;
> ++		case EV_NONE:
> ++			break;
> ++		default:
> ++			break;
> ++		}
> ++		break;
> ++
> ++	default:
> ++		break;
> ++	}
> ++
> ++	return next;
> ++}
> +diff --git a/fsm.h b/fsm.h
> +index e07d9a9..60f2805 100644
> +--- a/fsm.h
> ++++ b/fsm.h
> +@@ -60,6 +60,7 @@ enum fsm_event {
> + enum bmca_select {
> + 	BMCA_PTP,
> + 	BMCA_NOOP,
> ++	BMCA_RED_MASTER,
> + };
> +=20
> + /**
> +@@ -81,4 +82,22 @@ enum port_state ptp_fsm(enum port_state state, enum=
 fsm_event event, int mdiff);
> + enum port_state ptp_slave_fsm(enum port_state state, enum fsm_event e=
vent,
> + 			      int mdiff);
> +=20
> ++/**
> ++ * Run the state machine for a TC+OC setup on a redundant port setup.
> ++ * @param state  The current state of the port.
> ++ * @param event  The event to be processed.
> ++ * @param mdiff  Whether a new master has been selected.
> ++ * @return       The new state for the port.
> ++ */
> ++enum port_state ptp_red_m_fsm(enum port_state state, enum fsm_event e=
vent, int mdiff);
> ++
> ++/**
> ++ * Run the state machine for a TC+OC setup on a redundant port setup =
for a salve only clock.
> ++ * @param state  The current state of the port.
> ++ * @param event  The event to be processed.
> ++ * @param mdiff  Whether a new master has been selected.
> ++ * @return       The new state for the port.
> ++ */
> ++enum port_state ptp_red_slave_fsm(enum port_state state, enum fsm_eve=
nt event, int mdiff);
> ++
> + #endif
> +diff --git a/port.c b/port.c
> +index 586e365..7ade639 100644
> +--- a/port.c
> ++++ b/port.c
> +@@ -3628,6 +3628,8 @@ struct port *port_open(const char *phc_device,
> + 			pr_err("Please enable at least one of serverOnly or clientOnly whe=
n BMCA =3D=3D noop.\n");
> + 			goto err_transport;
> + 		}
> ++	} else if (p->bmca =3D=3D BMCA_RED_MASTER) {
> ++		p->state_machine =3D clock_slave_only(clock) ? ptp_red_slave_fsm : =
ptp_red_m_fsm;
> + 	} else {
> + 		p->state_machine =3D clock_slave_only(clock) ? ptp_slave_fsm : ptp_=
fsm;
> + 	}
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch b/meta-arago=
-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-Add-a-double-a=
ttached-clock-hybrid-clock-HC.patch
> new file mode 100644
> index 00000000..212e28b0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p=
_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
> @@ -0,0 +1,444 @@
> +From 13b25f731684d21102a8a288ab74d6bfcfe24640 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:39:45 +0200
> +Subject: [PATCH 07/13] p2p_hc: Add a double attached clock, hybrid clo=
ck (HC).
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The double attached clock, hybrid clock, is described in IEC 62439-3 f=
or
> +the two PRP/ HSR scenario with two ports.
> +
> +                =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +                =E2=94=83                             =E2=94=83
> +                =E2=94=83    Doubly Attached Node     =E2=94=83
> +                =E2=94=83    =E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=
=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=
=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84     =E2=94=
=83
> +                =E2=94=83           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE            =E2=94=83
> +                =E2=94=83           =E2=94=82 OC =E2=94=82            =
=E2=94=83
> +                =E2=94=83           =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AF            =E2=94=83
> +                =E2=94=83             =E2=95=91               =E2=94=83
> +                =E2=94=83             =E2=95=91               =E2=94=83
> +                =E2=94=83           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE            =E2=94=83
> +                =E2=94=83    =E2=95=94=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=94=82 TC =E2=94=82=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=97     =E2=94=83
> +                =E2=94=83    =E2=95=91      =E2=95=B0=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=95=AF      =E2=95=91     =E2=94=83
> +                =E2=94=83 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=95=AE           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=95=AE =E2=94=83
> +                =E2=94=83 =E2=94=82Port A=E2=94=82           =E2=94=82=
Port B=E2=94=82 =E2=94=83
> +                =E2=94=83 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=95=AF           =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=95=AF =E2=94=83
> +                =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
> +
> +The TC has three ports: One for each networking port and one for the O=
C.
> +The TC forwards SYNC packets from port A to B and to the OC to consume
> +it. It sends PDELAY_* messages and responds to them.
> +The OC receives usually two SYNC message which the TC received on both
> +ports. It keeps the "better" one and ignores the other. Therefore it
> +synchronises only against one of the two ports. In master mode the OC
> +sends a SYNC message on both ports.
> +
> +Add a HC which implements a TC and OC. Use it if the OC is set and clo=
ck
> +type is doubly attached.
> +The clock is assigned as a special case of OC/ BC. The PTP specificati=
on
> +mentions clockType for OC/ BC as 0/ 1 but the code is using 0x8000/
> +0x4000. I don't where this is used so it pretends to be a OC.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00011.h=
tml
> +
> + makefile       |   2 +-
> + p2p_hc.c       | 331 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
> + port.c         |   9 +-
> + port_private.h |   3 +
> + 4 files changed, 342 insertions(+), 3 deletions(-)
> + create mode 100644 p2p_hc.c
> +
> +diff --git a/makefile b/makefile
> +index 50c2d5a..e42e147 100644
> +--- a/makefile
> ++++ b/makefile
> +@@ -31,7 +31,7 @@ TS2PHC	=3D ts2phc.o lstab.o nmea.o serial.o sock.o t=
s2phc_generic_pps_source.o \
> +  ts2phc_nmea_pps_source.o ts2phc_phc_pps_source.o ts2phc_pps_sink.o t=
s2phc_pps_source.o
> + OBJ	=3D bmc.o clock.o clockadj.o clockcheck.o config.o designated_fsm=
.o \
> +  e2e_tc.o fault.o $(FILTERS) fsm.o hash.o interface.o monitor.o msg.o=
 phc.o \
> +- pmc_common.o port.o port_signaling.o pqueue.o print.o ptp4l.o p2p_tc=
.o rtnl.o \
> ++ pmc_common.o port.o port_signaling.o pqueue.o print.o ptp4l.o p2p_tc=
.o p2p_hc.o rtnl.o \
> +  $(SECURITY) $(SERVOS) sk.o stats.o tc.o $(TRANSP) telecom.o tlv.o ts=
proc.o \
> +  unicast_client.o unicast_fsm.o unicast_service.o util.o version.o
> +=20
> +diff --git a/p2p_hc.c b/p2p_hc.c
> +new file mode 100644
> +index 0000000..4c0dbd8
> +--- /dev/null
> ++++ b/p2p_hc.c
> +@@ -0,0 +1,331 @@
> ++/**
> ++ * @file p2p_hc.c
> ++ * @brief Implements a Hybrid Clock (Transparent Clock + Ordinary Clo=
ck).
> ++ * @note Copyright (C) 2025 Sebastian Andrzej Siewior <bigeasy@linutr=
onix.de>
> ++ * @note Based on TC/OC which is
> ++ * @note Copyright (C) 2018 Richard Cochran <richardcochran@gmail.com=
>
> ++ * @note SPDX-License-Identifier: GPL-2.0+
> ++ */
> ++#include <errno.h>
> ++
> ++#include "port.h"
> ++#include "port_private.h"
> ++#include "print.h"
> ++#include "rtnl.h"
> ++#include "sad.h"
> ++#include "tc.h"
> ++
> ++static int p2p_hc_delay_request(struct port *p)
> ++{
> ++	switch (p->state) {
> ++	case PS_INITIALIZING:
> ++	case PS_FAULTY:
> ++	case PS_DISABLED:
> ++		return 0;
> ++	case PS_LISTENING:
> ++	case PS_PRE_MASTER:
> ++	case PS_MASTER:
> ++	case PS_PASSIVE:
> ++	case PS_UNCALIBRATED:
> ++	case PS_SLAVE:
> ++	case PS_GRAND_MASTER:
> ++	case PS_PASSIVE_SLAVE:
> ++		break;
> ++	}
> ++	return port_delay_request(p);
> ++}
> ++
> ++static int port_set_sync_tx_tmo(struct port *p)
> ++{
> ++	return set_tmo_log(p->fda.fd[FD_SYNC_TX_TIMER], 1, p->logSyncInterva=
l);
> ++}
> ++
> ++static void flush_peer_delay(struct port *p)
> ++{
> ++	if (p->peer_delay_req) {
> ++		msg_put(p->peer_delay_req);
> ++		p->peer_delay_req =3D NULL;
> ++	}
> ++	if (p->peer_delay_resp) {
> ++		msg_put(p->peer_delay_resp);
> ++		p->peer_delay_resp =3D NULL;
> ++	}
> ++	if (p->peer_delay_fup) {
> ++		msg_put(p->peer_delay_fup);
> ++		p->peer_delay_fup =3D NULL;
> ++	}
> ++}
> ++
> ++void p2p_hc_dispatch(struct port *p, enum fsm_event event, int mdiff)
> ++{
> ++	if (clock_slave_only(p->clock)) {
> ++		if (event =3D=3D EV_RS_GRAND_MASTER) {
> ++			const char *n =3D p->log_name;
> ++			pr_warning("%s: master state recommended in slave only mode", n);
> ++			pr_warning("%s: defaultDS.priority1 probably misconfigured", n);
> ++		}
> ++	}
> ++
> ++	if (!port_state_update(p, event, mdiff)) {
> ++		return;
> ++	}
> ++
> ++	if (!portnum(p)) {
> ++		/* UDS needs no timers. */
> ++		return;
> ++	}
> ++	/* port_p2p_transition */
> ++	port_clr_tmo(p->fda.fd[FD_ANNOUNCE_TIMER]);
> ++	port_clr_tmo(p->fda.fd[FD_SYNC_RX_TIMER]);
> ++	/* Leave FD_DELAY_TIMER running. */
> ++	port_clr_tmo(p->fda.fd[FD_QUALIFICATION_TIMER]);
> ++	port_clr_tmo(p->fda.fd[FD_MANNO_TIMER]);
> ++	port_clr_tmo(p->fda.fd[FD_SYNC_TX_TIMER]);
> ++
> ++	/*
> ++	 * Handle the side effects of the state transition.
> ++	 */
> ++	switch (p->state) {
> ++	case PS_INITIALIZING:
> ++		break;
> ++	case PS_FAULTY:
> ++	case PS_DISABLED:
> ++		port_disable(p);
> ++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
> ++		break;
> ++	case PS_LISTENING:
> ++		port_set_announce_tmo(p);
> ++		port_set_delay_tmo(p);
> ++		break;
> ++	case PS_PRE_MASTER:
> ++		port_set_qualification_tmo(p);
> ++		break;
> ++	case PS_MASTER:
> ++	case PS_GRAND_MASTER:
> ++		if (!p->inhibit_announce) {
> ++			set_tmo_log(p->fda.fd[FD_MANNO_TIMER], 1, -10); /*~1ms*/
> ++		}
> ++		port_set_sync_tx_tmo(p);
> ++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
> ++		break;
> ++	case PS_PASSIVE:
> ++		port_set_announce_tmo(p);
> ++		break;
> ++	case PS_UNCALIBRATED:
> ++		flush_last_sync(p);
> ++		flush_peer_delay(p);
> ++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
> ++		/* fall through */
> ++	case PS_SLAVE:
> ++	case PS_PASSIVE_SLAVE:
> ++		port_set_announce_tmo(p);
> ++		break;
> ++	};
> ++}
> ++
> ++static int port_set_manno_tmo(struct port *p)
> ++{
> ++	return set_tmo_log(p->fda.fd[FD_MANNO_TIMER], 1, p->logAnnounceInter=
val);
> ++}
> ++
> ++enum fsm_event p2p_hc_event(struct port *p, int fd_index)
> ++{
> ++	int cnt, err, fd =3D p->fda.fd[fd_index];
> ++	enum fsm_event event =3D EV_NONE;
> ++	struct ptp_message *msg, *dup;
> ++
> ++	switch (fd_index) {
> ++	case FD_ANNOUNCE_TIMER:
> ++	case FD_SYNC_RX_TIMER:
> ++		pr_debug("%s: %s timeout", p->log_name,
> ++			 fd_index =3D=3D FD_SYNC_RX_TIMER ? "rx sync" : "announce");
> ++		if (p->best) {
> ++			fc_clear(p->best);
> ++		}
> ++
> ++		if (fd_index =3D=3D FD_SYNC_RX_TIMER) {
> ++			p->service_stats.sync_timeout++;
> ++		} else {
> ++			p->service_stats.announce_timeout++;
> ++		}
> ++
> ++		if (p->inhibit_announce) {
> ++			port_clr_tmo(p->fda.fd[FD_ANNOUNCE_TIMER]);
> ++		} else {
> ++			port_set_announce_tmo(p);
> ++		}
> ++
> ++		if (p->inhibit_announce) {
> ++			return EV_NONE;
> ++		}
> ++		return EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES;
> ++
> ++	case FD_DELAY_TIMER:
> ++		pr_debug("%s: delay timeout", p->log_name);
> ++		port_set_delay_tmo(p);
> ++		tc_prune(p);
> ++		return p2p_hc_delay_request(p) ? EV_FAULT_DETECTED : EV_NONE;
> ++
> ++	case FD_QUALIFICATION_TIMER:
> ++		pr_debug("%s: qualification timeout", p->log_name);
> ++		p->service_stats.qualification_timeout++;
> ++		return EV_QUALIFICATION_TIMEOUT_EXPIRES;
> ++
> ++	case FD_MANNO_TIMER:
> ++		pr_debug("%s: master tx announce timeout", p->log_name);
> ++		port_set_manno_tmo(p);
> ++		p->service_stats.master_announce_timeout++;
> ++		clock_update_leap_status(p->clock);
> ++		return port_tx_announce(p, NULL, p->seqnum.announce++) ?
> ++			EV_FAULT_DETECTED : EV_NONE;
> ++
> ++	case FD_SYNC_TX_TIMER:
> ++		pr_debug("%s: master sync timeout", p->log_name);
> ++		port_set_sync_tx_tmo(p);
> ++		p->service_stats.master_sync_timeout++;
> ++		return port_tx_sync(p, NULL, p->seqnum.sync++) ?
> ++			EV_FAULT_DETECTED : EV_NONE;
> ++
> ++	case FD_UNICAST_REQ_TIMER:
> ++	case FD_UNICAST_SRV_TIMER:
> ++		pr_err("unexpected timer expiration");
> ++		return EV_NONE;
> ++
> ++	case FD_RTNL:
> ++		pr_debug("%s: received link status notification", p->log_name);
> ++		rtnl_link_status(fd, p->name, port_link_status, p);
> ++		if (p->link_status =3D=3D (LINK_UP|LINK_STATE_CHANGED)) {
> ++			return EV_FAULT_CLEARED;
> ++		} else if ((p->link_status =3D=3D (LINK_DOWN|LINK_STATE_CHANGED)) |=
|
> ++			   (p->link_status & TS_LABEL_CHANGED)) {
> ++			return EV_FAULT_DETECTED;
> ++		} else {
> ++			return EV_NONE;
> ++		}
> ++	}
> ++
> ++	msg =3D msg_allocate();
> ++	if (!msg) {
> ++		return EV_FAULT_DETECTED;
> ++	}
> ++	msg->hwts.type =3D p->timestamping;
> ++
> ++	cnt =3D transport_recv(p->trp, fd, msg);
> ++	if (cnt <=3D 0) {
> ++		pr_err("%s: recv message failed", p->log_name);
> ++		msg_put(msg);
> ++		return EV_FAULT_DETECTED;
> ++	}
> ++
> ++	if (msg_sots_valid(msg)) {
> ++		ts_add(&msg->hwts.ts, -p->rx_timestamp_offset);
> ++	}
> ++	if (msg_unicast(msg)) {
> ++		pl_warning(600, "cannot switch unicast messages! type %s",
> ++			   msg_type_string(msg_type(msg)));
> ++		msg_put(msg);
> ++		return EV_NONE;
> ++	}
> ++
> ++	dup =3D msg_duplicate(msg, cnt);
> ++	if (!dup) {
> ++		msg_put(msg);
> ++		return EV_NONE;
> ++	}
> ++	msg_tlv_copy(dup, msg);
> ++	if (tc_ignore(p, dup)) {
> ++		msg_put(dup);
> ++		dup =3D NULL;
> ++	} else {
> ++		err =3D sad_process_auth(clock_config(p->clock), p->spp, dup, msg);
> ++		if (err) {
> ++			switch (err) {
> ++			case -EBADMSG:
> ++				pr_err("%s: auth: bad message", p->log_name);
> ++				break;
> ++			case -EPROTO:
> ++				pr_debug("%s: auth: ignoring message", p->log_name);
> ++				break;
> ++			}
> ++			msg_put(msg);
> ++			if (dup) {
> ++				msg_put(dup);
> ++			}
> ++			return EV_NONE;
> ++		}
> ++	}
> ++
> ++	switch (msg_type(msg)) {
> ++	case SYNC:
> ++		if (tc_fwd_sync(p, msg)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++			break;
> ++		}
> ++		if (dup) {
> ++			process_sync(p, dup);
> ++		}
> ++		break;
> ++	case DELAY_REQ:
> ++		break;
> ++	case PDELAY_REQ:
> ++		if (dup && process_pdelay_req(p, dup)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++		}
> ++		break;
> ++	case PDELAY_RESP:
> ++		if (dup && process_pdelay_resp(p, dup)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++		}
> ++		break;
> ++	case FOLLOW_UP:
> ++		if (tc_fwd_folup(p, msg)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++			break;
> ++		}
> ++		if (dup) {
> ++			process_follow_up(p, dup);
> ++		}
> ++		break;
> ++	case DELAY_RESP:
> ++		break;
> ++	case PDELAY_RESP_FOLLOW_UP:
> ++		if (dup) {
> ++			process_pdelay_resp_fup(p, dup);
> ++		}
> ++		break;
> ++	case ANNOUNCE:
> ++		if (tc_forward(p, msg)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++			break;
> ++		}
> ++		if (dup && process_announce(p, dup)) {
> ++			event =3D EV_STATE_DECISION_EVENT;
> ++		}
> ++		break;
> ++	case SIGNALING:
> ++		if (tc_forward(p, msg)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++			break;
> ++		}
> ++		if (dup && process_signaling(p, dup)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++		}
> ++		break;
> ++
> ++	case MANAGEMENT:
> ++		if (tc_forward(p, msg)) {
> ++			event =3D EV_FAULT_DETECTED;
> ++			break;
> ++		}
> ++		if (dup && clock_manage(p->clock, p, dup)) {
> ++			event =3D EV_STATE_DECISION_EVENT;
> ++		}
> ++		break;
> ++	}
> ++
> ++	msg_put(msg);
> ++	if (dup) {
> ++		msg_put(dup);
> ++	}
> ++	return event;
> ++}
> +diff --git a/port.c b/port.c
> +index 7ade639..50a3a75 100644
> +--- a/port.c
> ++++ b/port.c
> +@@ -3592,8 +3592,13 @@ struct port *port_open(const char *phc_device,
> + 	switch (type) {
> + 	case CLOCK_TYPE_ORDINARY:
> + 	case CLOCK_TYPE_BOUNDARY:
> +-		p->dispatch =3D bc_dispatch;
> +-		p->event =3D bc_event;
> ++		if (clock_type_is_DAC(clock)) {
> ++			p->dispatch =3D p2p_hc_dispatch;
> ++			p->event =3D p2p_hc_event;
> ++		} else {
> ++			p->dispatch =3D bc_dispatch;
> ++			p->event =3D bc_event;
> ++		}
> + 		break;
> + 	case CLOCK_TYPE_P2P:
> + 		p->dispatch =3D p2p_dispatch;
> +diff --git a/port_private.h b/port_private.h
> +index 79b1d31..507c296 100644
> +--- a/port_private.h
> ++++ b/port_private.h
> +@@ -185,6 +185,9 @@ enum fsm_event e2e_event(struct port *p, int fd_in=
dex);
> + void p2p_dispatch(struct port *p, enum fsm_event event, int mdiff);
> + enum fsm_event p2p_event(struct port *p, int fd_index);
> +=20
> ++void p2p_hc_dispatch(struct port *p, enum fsm_event event, int mdiff)=
;
> ++enum fsm_event p2p_hc_event(struct port *p, int fd_index);
> ++
> + int clear_fault_asap(struct fault_interval *faint);
> + void delay_req_prune(struct port *p);
> + void fc_clear(struct foreign_clock *fc);
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch b/meta-arago-=
distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allow-to-forward-pa=
ckets-both-ways-in-DAC-mode.patch
> new file mode 100644
> index 00000000..0f1f1720
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-=
Allow-to-forward-packets-both-ways-in-DAC-mode.patch
> @@ -0,0 +1,37 @@
> +From 104fcfab6c17c3dfd2d72e1da51e631355d4f204 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:45:44 +0200
> +Subject: [PATCH 08/13] tc: Allow to forward packets both ways in DAC m=
ode
> +
> +In a HSR/ DAC setup, the TC should forward SYNC, FOLLOW-UP packets in
> +both directions.
> +
> +Allow to forward packets both ways in DAC mode.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00018.h=
tml
> +
> + tc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tc.c b/tc.c
> +index 0fd1bc4..109947d 100644
> +--- a/tc.c
> ++++ b/tc.c
> +@@ -105,7 +105,7 @@ static int tc_blocked(struct port *q, struct port =
*p, struct ptp_message *m)
> + 	case PS_SLAVE:
> + 	case PS_PASSIVE_SLAVE:
> + 		/* Delay_Req swims against the stream. */
> +-		if (msg_type(m) !=3D DELAY_REQ) {
> ++		if (!clock_type_is_DAC(p->clock) && msg_type(m) !=3D DELAY_REQ) {
> + 			return 1;
> + 		}
> + 		break;
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch b/meta-ara=
go-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-Add-a-safe-gua=
rd-in-case-PASSIVE_SLAVE-attempts.patch
> new file mode 100644
> index 00000000..c979b42b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-por=
t-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
> @@ -0,0 +1,37 @@
> +From e8a1ada27bd5065fcbe04d1f56db05060cfe967f Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 10:46:17 +0200
> +Subject: [PATCH 09/13] port: Add a safe guard in case PASSIVE_SLAVE at=
tempts
> + to sync
> +
> +Add a error message in case port_synchronize() attempts to synchronize
> +the lock on a port in PASSIVE_SLAVE state.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00015.h=
tml
> +
> + port.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/port.c b/port.c
> +index 50a3a75..68d77ad 100644
> +--- a/port.c
> ++++ b/port.c
> +@@ -1434,6 +1434,9 @@ static void port_synchronize(struct port *p,
> + 			     clock_parent_identity(p->clock), seqid,
> + 			     t1, tmv_add(c1, c2), t2);
> + 		break;
> ++	case PS_PASSIVE_SLAVE:
> ++		pr_err("Port in passive slave attempts to synchronize");
> ++		return;
> + 	default:
> + 		break;
> + 	}
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
010-tc-Allow-to-forward-packets-in-LISTEN-state.patch b/meta-arago-distro=
/recipes-connectivity/linuxptp/linuxptp/0010-tc-Allow-to-forward-packets-=
in-LISTEN-state.patch
> new file mode 100644
> index 00000000..2618868b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-=
Allow-to-forward-packets-in-LISTEN-state.patch
> @@ -0,0 +1,61 @@
> +From 04c95905fd0d323930e2fe443c59a127e301c818 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 13:01:53 +0200
> +Subject: [PATCH 10/13] tc: Allow to forward packets in LISTEN state
> +
> +In the HSR/ DAC network, the port which receives ANNOUNCE messages
> +enters SLAVE state. The other port remains in LISTEN state since it do=
es
> +not receive any PTP packets.
> +The tc_blocked() forbids to forward a packet if the EGRESS port is in
> +listen state.
> +
> +Allow to forward packets if the EGRESS port is in LISTEN state. If the
> +packets make their way through the ring, the port will eventually swit=
ch
> +to PASSIVE_SLAVE state.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00019.h=
tml
> +
> + tc.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tc.c b/tc.c
> +index 109947d..15b83c4 100644
> +--- a/tc.c
> ++++ b/tc.c
> +@@ -75,7 +75,6 @@ static int tc_blocked(struct port *q, struct port *p=
, struct ptp_message *m)
> + 	case PS_INITIALIZING:
> + 	case PS_FAULTY:
> + 	case PS_DISABLED:
> +-	case PS_LISTENING:
> + 	case PS_PRE_MASTER:
> + 	case PS_PASSIVE:
> + 		return 1;
> +@@ -86,6 +85,7 @@ static int tc_blocked(struct port *q, struct port *p=
, struct ptp_message *m)
> + 			return 1;
> + 		}
> + 		break;
> ++	case PS_LISTENING:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> + 	case PS_PASSIVE_SLAVE:
> +@@ -97,10 +97,10 @@ static int tc_blocked(struct port *q, struct port =
*p, struct ptp_message *m)
> + 	case PS_INITIALIZING:
> + 	case PS_FAULTY:
> + 	case PS_DISABLED:
> +-	case PS_LISTENING:
> + 	case PS_PRE_MASTER:
> + 	case PS_PASSIVE:
> + 		return 1;
> ++	case PS_LISTENING:
> + 	case PS_UNCALIBRATED:
> + 	case PS_SLAVE:
> + 	case PS_PASSIVE_SLAVE:
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
011-raw-Add-HSR-handling.patch b/meta-arago-distro/recipes-connectivity/l=
inuxptp/linuxptp/0011-raw-Add-HSR-handling.patch
> new file mode 100644
> index 00000000..8de6a039
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw=
-Add-HSR-handling.patch
> @@ -0,0 +1,567 @@
> +From 96629470ca54aba5049414c8fdd67427d8cdec9a Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Wed, 22 Oct 2025 15:42:28 +0200
> +Subject: [PATCH 11/13] raw: Add HSR handling
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +In a HSR network each device as two port attached to the HSR ring. The
> +two ports are usually called port A and port B. The communication is
> +Ethernet based and the payload part is ETH_P_HSR. After the HSR header=
,
> +for PTP the payload is ETH_P_1588 as usual. So we have either
> +
> +     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +     =E2=94=82 MAC DST =E2=94=82 MAC SRC =E2=94=82 HSR-TAG =E2=94=82 P=
TP =E2=94=82
> +     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> +or with VLAN enabled
> +     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +     =E2=94=82 MAC DST =E2=94=82 MAC SRC =E2=94=82 VLAN-TAG =E2=94=82 =
HSR-TAG =E2=94=82 PTP =E2=94=82
> +     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> +
> +The kernel is supposed not to forward HSR packets with ETH_P_1588
> +payload. Also it must support socket option PACKET_HSR_BIND_PORT to bi=
nd
> +the hsr device to one of the two ports via PACKET_HSR_BIND_PORT_A or
> +PACKET_HSR_BIND_PORT_B. It needs to support PACKET_HSR_INFO with the
> +option PACKET_HSR_INFO_HAS_HDR for the control message in order to sen=
d
> +HSR with a HSR header. These changes are not merged into the upstream.
> +
> +This interface is used by ptp4l to receive both copies of a packets an=
d
> +to send a packet on one of the two ports including a PTP timestamp.
> +
> +The clock is setup as TC which means the forwarding done by ptp4l will
> +properly update the correction header. The HSR header of a received
> +message is saved so it can be used while the packet is forwarded. This
> +is important to keep the MAC address of the sender but also to keep HS=
R
> +fields such as sequence number or port.
> +The PDELAY_* packets are not forwarded and instead responded to. Here
> +the HSR header is constructed by the HSR stack and the packet is sent
> +only on the request port.
> +
> +The added BPF filter is based on the existing one and adds HSR type
> +handling and ignores possible VLAN. The filter drops all packets which
> +are sent by "us". The sender is supposed to remove his packets from th=
e
> +ring.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00012.h=
tml
> +
> + ether.h   |   9 ++
> + missing.h |  13 +++
> + msg.c     |   3 +-
> + msg.h     |   6 ++
> + raw.c     | 312 +++++++++++++++++++++++++++++++++++++++++++++++------=
-
> + 5 files changed, 301 insertions(+), 42 deletions(-)
> +
> +diff --git a/ether.h b/ether.h
> +index 276eec4..577a07e 100644
> +--- a/ether.h
> ++++ b/ether.h
> +@@ -48,4 +48,13 @@ struct vlan_hdr {
> + 	uint16_t type;
> + } __attribute__((packed));
> +=20
> ++struct hsr_hdr {
> ++	eth_addr dst;
> ++	eth_addr src;
> ++	uint16_t type;
> ++	uint16_t pathid_and_LSDU_size;
> ++	uint16_t sequence_nr;
> ++	uint16_t encap_type;
> ++} __attribute__((packed));
> ++
> + #endif
> +diff --git a/missing.h b/missing.h
> +index c6be8fd..583e035 100644
> +--- a/missing.h
> ++++ b/missing.h
> +@@ -137,6 +137,19 @@ enum {
> + #define PTP_PEROUT_REQUEST2 PTP_PEROUT_REQUEST
> + #endif
> +=20
> ++#ifndef PACKET_HSR_BIND_PORT
> ++#define PACKET_HSR_BIND_PORT	25
> ++
> ++/* For HSR, bind port */
> ++#define PACKET_HSR_BIND_PORT_AB		0
> ++#define PACKET_HSR_BIND_PORT_A		1
> ++#define PACKET_HSR_BIND_PORT_B		2
> ++/* HSR, CMSG */
> ++#define PACKET_HSR_INFO			1
> ++#define PACKET_HSR_INFO_HAS_HDR		1
> ++
> ++#endif
> ++
> + #if LINUX_VERSION_CODE < KERNEL_VERSION(6,5,0)
> +=20
> + /* from upcoming Linux kernel version 6.5 */
> +diff --git a/msg.c b/msg.c
> +index 7c236c3..9989456 100644
> +--- a/msg.c
> ++++ b/msg.c
> +@@ -32,7 +32,8 @@ int assume_two_step =3D 0;
> + uint8_t ptp_hdr_ver =3D PTP_VERSION;
> +=20
> + /*
> +- * Head room fits a VLAN Ethernet header, and 'msg' is 64 bit aligned=
.
> ++ * Head room fits a VLAN Ethernet header or a HSR-Ethernet header, an=
d 'msg' is
> ++ * 64 bit aligned.
> +  */
> + #define MSG_HEADROOM 24
> +=20
> +diff --git a/msg.h b/msg.h
> +index 58c2287..c53e07b 100644
> +--- a/msg.h
> ++++ b/msg.h
> +@@ -29,6 +29,7 @@
> + #include "ddt.h"
> + #include "tlv.h"
> + #include "tmv.h"
> ++#include "ether.h"
> +=20
> + /* Version definition for IEEE 1588-2019 */
> + #define PTP_MAJOR_VERSION	2
> +@@ -238,6 +239,11 @@ struct ptp_message {
> + 	 * pointers to the appended TLVs.
> + 	 */
> + 	TAILQ_HEAD(tlv_list, tlv_extra) tlv_list;
> ++	/**
> ++	 * Containing the HSR header
> ++	 */
> ++	struct hsr_hdr hsr_header;
> ++	int hsr_header_valid;
> + };
> +=20
> + /**
> +diff --git a/raw.c b/raw.c
> +index c809233..eb01072 100644
> +--- a/raw.c
> ++++ b/raw.c
> +@@ -46,6 +46,7 @@
> + #include "sk.h"
> + #include "transport_private.h"
> + #include "util.h"
> ++#include "rtnl.h"
> +=20
> + struct raw {
> + 	struct transport t;
> +@@ -53,10 +54,87 @@ struct raw {
> + 	struct address ptp_addr;
> + 	struct address p2p_addr;
> + 	int vlan;
> ++	int hsr_slave;
> + };
> +=20
> + #define PRP_TRAILER_LEN 6
> +=20
> ++/*
> ++ * tcpdump -d
> ++ *  'ether[12:2] =3D=3D 0x892f && ether[18:2] =3D=3D 0x88F7 and
> ++ *  (ether[18 +2:1] & 0x8 =3D=3D 0x8) &&
> ++ *   not ether src 11:22:33:44:55:66'
> ++ *
> ++ * (000) ldh      [12]
> ++ * (001) jeq      #0x892f          jt 2	jf 12
> ++ * (002) ldh      [18]
> ++ * (003) jeq      #0x88f7          jt 4	jf 12
> ++ * (004) ldb      [20]
> ++ * (005) and      #0x8
> ++ * (006) jeq      #0x8             jt 7	jf 12
> ++ * (007) ld       [8]
> ++ * (008) jeq      #0x33445566      jt 9	jf 11
> ++ * (009) ldh      [6]
> ++ * (010) jeq      #0x1122          jt 12	jf 11
> ++ * (011) ret      #262144
> ++ * (012) ret      #0
> ++ */
> ++static struct sock_filter raw_filter_hsr_norm_general[] =3D {
> ++	{ 0x28, 0, 0, 0x0000000c },
> ++	{ 0x15, 0, 10, 0x0000892f },
> ++	{ 0x28, 0, 0, 0x00000012 },
> ++	{ 0x15, 0, 8, 0x000088f7 },
> ++	{ 0x30, 0, 0, 0x00000014 },
> ++	{ 0x54, 0, 0, 0x00000008 },
> ++	{ 0x15, 0, 5, 0x00000008 },
> ++	{ 0x20, 0, 0, 0x00000008 },
> ++	{ 0x15, 0, 2, 0x33445566 },
> ++	{ 0x28, 0, 0, 0x00000006 },
> ++	{ 0x15, 1, 0, 0x00001122 },
> ++	{ 0x6, 0, 0, 0x00040000 },
> ++	{ 0x6, 0, 0, 0x00000000 },
> ++};
> ++#define FILTER_HSR_GENERAL_SRC0 10
> ++#define FILTER_HSR_GENERAL_SRC2 8
> ++
> ++/*
> ++ * tcpdump -d
> ++ *  'ether[12:2] =3D=3D 0x892f && ether[18:2] =3D=3D 0x88F7 and
> ++ *   (ether[18 +2:1] & 0x8 !=3D 0x8) &&
> ++ *   not ether src 11:22:33:44:55:66'
> ++ *
> ++ * (000) ldh      [12]
> ++ * (001) jeq      #0x892f          jt 2	jf 12
> ++ * (002) ldh      [18]
> ++ * (003) jeq      #0x88f7          jt 4	jf 12
> ++ * (004) ldb      [20]
> ++ * (005) and      #0x8
> ++ * (006) jeq      #0x8             jt 12	jf 7
> ++ * (007) ld       [8]
> ++ * (008) jeq      #0x33445566      jt 9	jf 11
> ++ * (009) ldh      [6]
> ++ * (010) jeq      #0x1122          jt 12	jf 11
> ++ * (011) ret      #262144
> ++ * (012) ret      #0
> ++ */
> ++static struct sock_filter raw_filter_hsr_norm_event[] =3D {
> ++	{ 0x28, 0, 0, 0x0000000c },
> ++	{ 0x15, 0, 10, 0x0000892f },
> ++	{ 0x28, 0, 0, 0x00000012 },
> ++	{ 0x15, 0, 8, 0x000088f7 },
> ++	{ 0x30, 0, 0, 0x00000014 },
> ++	{ 0x54, 0, 0, 0x00000008 },
> ++	{ 0x15, 5, 0, 0x00000008 },
> ++	{ 0x20, 0, 0, 0x00000008 },
> ++	{ 0x15, 0, 2, 0x33445566 },
> ++	{ 0x28, 0, 0, 0x00000006 },
> ++	{ 0x15, 1, 0, 0x00001122 },
> ++	{ 0x6, 0, 0, 0x00040000 },
> ++	{ 0x6, 0, 0, 0x00000000 },
> ++};
> ++#define FILTER_HSR_EVENT_SRC0 10
> ++#define FILTER_HSR_EVENT_SRC2 8
> ++
> + /*
> +  * tcpdump -d \
> +  * '((ether[12:2] =3D=3D 0x8100 and ether[12 + 4 :2] =3D=3D 0x88F7 an=
d ether[14+4 :1] & 0x8 =3D=3D 0x8) or '\
> +@@ -153,32 +231,59 @@ static struct sock_filter raw_filter_vlan_norm_e=
vent[] =3D {
> +=20
> + static int raw_configure(int fd, int event, int index,
> + 			 unsigned char *local_addr, unsigned char *addr1,
> +-			 unsigned char *addr2, int enable)
> ++			 unsigned char *addr2, int enable, int hsr_slave)
> + {
> + 	int err1, err2, option;
> + 	struct packet_mreq mreq;
> + 	struct sock_fprog prg;
> +=20
> +-	if (event) {
> +-		prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_event);
> +-		prg.filter =3D raw_filter_vlan_norm_event;
> +-
> +-		memcpy(&prg.filter[FILTER_EVENT_POS_SRC0].k, local_addr, 2);
> +-		memcpy(&prg.filter[FILTER_EVENT_POS_SRC2].k, local_addr + 2, 4);
> +-		prg.filter[FILTER_EVENT_POS_SRC0].k =3D
> +-			ntohs(prg.filter[FILTER_EVENT_POS_SRC0].k);
> +-		prg.filter[FILTER_EVENT_POS_SRC2].k =3D
> +-			ntohl(prg.filter[FILTER_EVENT_POS_SRC2].k);
> ++	if (hsr_slave) {
> ++		if (event) {
> ++			prg.len =3D ARRAY_SIZE(raw_filter_hsr_norm_event);
> ++			prg.filter =3D raw_filter_hsr_norm_event;
> ++
> ++			memcpy(&prg.filter[FILTER_HSR_EVENT_SRC0].k, local_addr, 2);
> ++			memcpy(&prg.filter[FILTER_HSR_EVENT_SRC2].k, local_addr + 2, 4);
> ++
> ++			prg.filter[FILTER_HSR_EVENT_SRC0].k =3D
> ++				ntohs(prg.filter[FILTER_HSR_EVENT_SRC0].k);
> ++			prg.filter[FILTER_HSR_EVENT_SRC2].k =3D
> ++				ntohl(prg.filter[FILTER_HSR_EVENT_SRC2].k);
> ++		} else {
> ++			prg.len =3D ARRAY_SIZE(raw_filter_hsr_norm_general);
> ++			prg.filter =3D raw_filter_hsr_norm_general;
> ++
> ++			memcpy(&prg.filter[FILTER_HSR_GENERAL_SRC0].k, local_addr, 2);
> ++			memcpy(&prg.filter[FILTER_HSR_GENERAL_SRC2].k, local_addr + 2, 4);
> ++
> ++			prg.filter[FILTER_HSR_GENERAL_SRC0].k =3D
> ++				ntohs(prg.filter[FILTER_HSR_GENERAL_SRC0].k);
> ++			prg.filter[FILTER_HSR_GENERAL_SRC2].k =3D
> ++				ntohl(prg.filter[FILTER_HSR_GENERAL_SRC2].k);
> ++		}
> + 	} else {
> +-		prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_general);
> +-		prg.filter =3D raw_filter_vlan_norm_general;
> +-
> +-		memcpy(&prg.filter[FILTER_GENERAL_POS_SRC0].k, local_addr, 2);
> +-		memcpy(&prg.filter[FILTER_GENERAL_POS_SRC2].k, local_addr + 2, 4);
> +-		prg.filter[FILTER_GENERAL_POS_SRC0].k =3D
> +-			ntohs(prg.filter[FILTER_GENERAL_POS_SRC0].k);
> +-		prg.filter[FILTER_GENERAL_POS_SRC2].k =3D
> +-			ntohl(prg.filter[FILTER_GENERAL_POS_SRC2].k);
> ++		if (event) {
> ++			prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_event);
> ++			prg.filter =3D raw_filter_vlan_norm_event;
> ++
> ++			memcpy(&prg.filter[FILTER_EVENT_POS_SRC0].k, local_addr, 2);
> ++			memcpy(&prg.filter[FILTER_EVENT_POS_SRC2].k, local_addr + 2, 4);
> ++			prg.filter[FILTER_EVENT_POS_SRC0].k =3D
> ++				ntohs(prg.filter[FILTER_EVENT_POS_SRC0].k);
> ++			prg.filter[FILTER_EVENT_POS_SRC2].k =3D
> ++				ntohl(prg.filter[FILTER_EVENT_POS_SRC2].k);
> ++		} else {
> ++			prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_general);
> ++			prg.filter =3D raw_filter_vlan_norm_general;
> ++
> ++			memcpy(&prg.filter[FILTER_GENERAL_POS_SRC0].k, local_addr, 2);
> ++			memcpy(&prg.filter[FILTER_GENERAL_POS_SRC2].k, local_addr + 2, 4);
> ++			prg.filter[FILTER_GENERAL_POS_SRC0].k =3D
> ++				ntohs(prg.filter[FILTER_GENERAL_POS_SRC0].k);
> ++			prg.filter[FILTER_GENERAL_POS_SRC2].k =3D
> ++				ntohl(prg.filter[FILTER_GENERAL_POS_SRC2].k);
> ++
> ++		}
> + 	}
> +=20
> + 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &prg, sizeof(prg)))=
 {
> +@@ -236,7 +341,7 @@ static int raw_close(struct transport *t, struct f=
darray *fda)
> +=20
> + static int open_socket(const char *name, int event, unsigned char *lo=
cal_addr,
> + 		       unsigned char *ptp_dst_mac, unsigned char *p2p_dst_mac,
> +-		       int socket_priority)
> ++		       int socket_priority, int hsr_slave)
> + {
> + 	struct sockaddr_ll addr;
> + 	int fd, index;
> +@@ -256,8 +361,22 @@ static int open_socket(const char *name, int even=
t, unsigned char *local_addr,
> + 		pr_err("setsockopt SO_PRIORITY failed: %m");
> + 		goto no_option;
> + 	}
> ++	if (hsr_slave) {
> ++		int option;
> ++
> ++		if (hsr_slave =3D=3D 1)
> ++			option =3D PACKET_HSR_BIND_PORT_A;
> ++		else
> ++			option =3D PACKET_HSR_BIND_PORT_B;
> ++
> ++		if (setsockopt(fd, SOL_PACKET, PACKET_HSR_BIND_PORT, &option,
> ++				 sizeof(option))) {
> ++			pr_err("setsockopt(SOL_PACKET, PACKET_HSR_BIND_PORT) failed: %m");
> ++			goto no_option;
> ++		}
> ++	}
> + 	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
> +-			  p2p_dst_mac, 1))
> ++			  p2p_dst_mac, 1, hsr_slave))
> + 		goto no_option;
> +=20
> + 	memset(&addr, 0, sizeof(addr));
> +@@ -352,7 +471,7 @@ static int raw_open(struct transport *t, struct in=
terface *iface,
> + 	unsigned char ptp_dst_mac[MAC_LEN];
> + 	unsigned char p2p_dst_mac[MAC_LEN];
> + 	int efd, gfd, socket_priority;
> +-	const char *name;
> ++	const char *name, *hsr_device;
> + 	char *str;
> +=20
> + 	name =3D interface_label(iface);
> +@@ -369,18 +488,45 @@ static int raw_open(struct transport *t, struct =
interface *iface,
> + 	mac_to_addr(&raw->ptp_addr, ptp_dst_mac);
> + 	mac_to_addr(&raw->p2p_addr, p2p_dst_mac);
> +=20
> ++	hsr_device =3D config_get_string(t->cfg, name, "hsr_device");
> ++	if (!strlen(hsr_device))
> ++		hsr_device =3D NULL;
> ++	if (hsr_device) {
> ++		char hsr_slave_A[IF_NAMESIZE];
> ++		char hsr_slave_B[IF_NAMESIZE];
> ++		int ret;
> ++
> ++		ret =3D rtnl_get_hsr_devices(hsr_device, hsr_slave_A, hsr_slave_B);
> ++		if (ret < 0) {
> ++			pr_err("Failed to query hsr device %s", hsr_device);
> ++			goto no_mac;
> ++		}
> ++		if (!strcmp(name, hsr_slave_A)) {
> ++			raw->hsr_slave =3D 1;
> ++		} else if (!strcmp(name, hsr_slave_B)) {
> ++			raw->hsr_slave =3D 2;
> ++		} else {
> ++			pr_err("HSR device %s has no slave %s", hsr_device, name);
> ++			goto no_mac;
> ++		}
> ++
> ++		pr_notice("raw: HSR interface %s/%s, port %c",
> ++			  hsr_device, name,
> ++			  raw->hsr_slave =3D=3D 1 ? 'A' : 'B');
> ++	}
> ++
> + 	if (sk_interface_macaddr(name, &raw->src_addr))
> + 		goto no_mac;
> +=20
> + 	socket_priority =3D config_get_int(t->cfg, "global", "socket_priorit=
y");
> +=20
> +-	efd =3D open_socket(name, 1, raw->src_addr.sll.sll_addr, ptp_dst_mac=
,
> +-			  p2p_dst_mac, socket_priority);
> ++	efd =3D open_socket(hsr_device ?: name, 1, raw->src_addr.sll.sll_add=
r, ptp_dst_mac,
> ++			  p2p_dst_mac, socket_priority, raw->hsr_slave);
> + 	if (efd < 0)
> + 		goto no_event;
> +=20
> +-	gfd =3D open_socket(name, 0, raw->src_addr.sll.sll_addr, p2p_dst_mac=
,
> +-			  p2p_dst_mac, socket_priority);
> ++	gfd =3D open_socket(hsr_device ?: name, 0, raw->src_addr.sll.sll_add=
r, p2p_dst_mac,
> ++			  p2p_dst_mac, socket_priority, raw->hsr_slave);
> + 	if (gfd < 0)
> + 		goto no_general;
> +=20
> +@@ -412,7 +558,9 @@ static int raw_recv(struct transport *t, int fd, v=
oid *buf, int buflen,
> + 	struct eth_hdr *hdr;
> + 	int cnt, hlen;
> +=20
> +-	if (raw->vlan) {
> ++	if (raw->hsr_slave) {
> ++		hlen =3D sizeof(struct hsr_hdr);
> ++	} else if (raw->vlan) {
> + 		hlen =3D sizeof(struct vlan_hdr);
> + 	} else {
> + 		hlen =3D sizeof(struct eth_hdr);
> +@@ -431,7 +579,21 @@ static int raw_recv(struct transport *t, int fd, =
void *buf, int buflen,
> + 	if (has_prp_trailer(buf, cnt))
> + 		cnt -=3D PRP_TRAILER_LEN;
> +=20
> +-	if (raw->vlan) {
> ++	if (raw->hsr_slave) {
> ++		struct hsr_hdr *hsr_hdr =3D (struct hsr_hdr *) ptr;
> ++		struct ptp_message *m =3D buf;
> ++		unsigned int hsr_size;
> ++
> ++		hsr_size =3D ntohs(hsr_hdr->pathid_and_LSDU_size) & 0xfff;
> ++		if (hsr_size !=3D cnt + 6) {
> ++			pr_notice("Dropping bad sized HSR packet (%d vs %d)", hsr_size, cn=
t);
> ++			return 0;
> ++		}
> ++
> ++		memcpy(&m->hsr_header, hsr_hdr, sizeof(struct hsr_hdr));
> ++		m->hsr_header_valid =3D 1;
> ++
> ++	} else if (raw->vlan) {
> + 		if (ETH_P_1588 =3D=3D ntohs(hdr->type)) {
> + 			pr_notice("raw: disabling VLAN mode");
> + 			raw->vlan =3D 0;
> +@@ -445,14 +607,37 @@ static int raw_recv(struct transport *t, int fd,=
 void *buf, int buflen,
> + 	return cnt;
> + }
> +=20
> ++static unsigned int put_cmsg(struct msghdr *msg, unsigned int msg_off=
, int ctrl_tot,
> ++			     int level, int type, int len, void *data)
> ++{
> ++	struct cmsghdr *cm;
> ++	int cmlen =3D CMSG_LEN(len);
> ++
> ++	if (msg->msg_controllen + cmlen >=3D ctrl_tot)
> ++		return 0;
> ++
> ++	cm =3D msg->msg_control + msg_off;
> ++	cm->cmsg_level =3D level;
> ++	cm->cmsg_type =3D type;
> ++	cm->cmsg_len =3D cmlen;
> ++
> ++	memcpy(CMSG_DATA(cm), data, cmlen - sizeof(*cm));
> ++	cmlen =3D CMSG_SPACE(len);
> ++	if (cmlen > ctrl_tot - msg_off)
> ++		cmlen =3D ctrl_tot - msg_off;
> ++
> ++	msg->msg_controllen +=3D cmlen;
> ++	return msg_off + cmlen;
> ++}
> ++
> + static int raw_send(struct transport *t, struct fdarray *fda,
> + 		    enum transport_event event, int peer, void *buf, int len,
> + 		    struct address *addr, struct hw_timestamp *hwts)
> + {
> + 	struct raw *raw =3D container_of(t, struct raw, t);
> ++	struct ptp_message *m =3D buf;
> + 	ssize_t cnt;
> + 	unsigned char pkt[1600], *ptr =3D buf;
> +-	struct eth_hdr *hdr;
> + 	int fd =3D -1;
> +=20
> + 	switch (event) {
> +@@ -467,22 +652,67 @@ static int raw_send(struct transport *t, struct =
fdarray *fda,
> + 		break;
> + 	}
> +=20
> +-	ptr -=3D sizeof(*hdr);
> +-	len +=3D sizeof(*hdr);
> ++	if (raw->hsr_slave && m->hsr_header_valid) {
> ++		struct hsr_hdr *hdr;
> ++		unsigned int pathid;
> ++		struct msghdr msg;
> ++		char control[256];
> ++		struct iovec iov =3D { ptr, len };
> ++		unsigned int hsr_option;
> +=20
> +-	if (!addr)
> +-		addr =3D peer ? &raw->p2p_addr : &raw->ptp_addr;
> ++		ptr -=3D sizeof(*hdr);
> ++		len +=3D sizeof(*hdr);
> +=20
> +-	hdr =3D (struct eth_hdr *) ptr;
> +-	addr_to_mac(&hdr->dst, addr);
> +-	addr_to_mac(&hdr->src, &raw->src_addr);
> ++		hdr =3D (struct hsr_hdr *)ptr;
> ++		memcpy(hdr, &m->hsr_header, sizeof(struct hsr_hdr));
> ++
> ++		/*
> ++		 * The sender might have used a larger padding than neccessary.
> ++		 * Sending a smaller packet requires to update the HSR header.
> ++		 */
> ++		pathid =3D ntohs(hdr->pathid_and_LSDU_size) & ~0x0fff;
> ++		hdr->pathid_and_LSDU_size =3D htons((len - sizeof(struct eth_hdr)) =
| pathid);
> ++
> ++		iov.iov_base =3D ptr;
> ++		iov.iov_len =3D len;
> +=20
> +-	hdr->type =3D htons(ETH_P_1588);
> ++		memset(control, 0, sizeof(control));
> ++		memset(&msg, 0, sizeof(msg));
> +=20
> +-	cnt =3D send(fd, ptr, len, 0);
> +-	if (cnt < 1) {
> +-		return -errno;
> ++		msg.msg_iov =3D &iov;
> ++		msg.msg_iovlen =3D 1;
> ++		msg.msg_control =3D control;
> ++
> ++		hsr_option =3D PACKET_HSR_INFO_HAS_HDR;
> ++
> ++		put_cmsg(&msg, 0, sizeof(control), SOL_PACKET, PACKET_HSR_INFO,
> ++			 sizeof(hsr_option), &hsr_option);
> ++
> ++		cnt =3D sendmsg(fd, &msg, 0);
> ++		if (cnt < 1) {
> ++			return -errno;
> ++		}
> ++	} else {
> ++		struct eth_hdr *hdr;
> ++
> ++		ptr -=3D sizeof(*hdr);
> ++		len +=3D sizeof(*hdr);
> ++
> ++		if (!addr)
> ++			addr =3D peer ? &raw->p2p_addr : &raw->ptp_addr;
> ++
> ++		hdr =3D (struct eth_hdr *) ptr;
> ++		addr_to_mac(&hdr->dst, addr);
> ++		addr_to_mac(&hdr->src, &raw->src_addr);
> ++
> ++		hdr->type =3D htons(ETH_P_1588);
> ++
> ++		cnt =3D send(fd, ptr, len, 0);
> ++		if (cnt < 1) {
> ++			return -errno;
> ++		}
> + 	}
> ++
> + 	/*
> + 	 * Get the time stamp right away.
> + 	 */
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
012-configs-Add-sample-configs-for-the-HSR-setup.patch b/meta-arago-distr=
o/recipes-connectivity/linuxptp/linuxptp/0012-configs-Add-sample-configs-=
for-the-HSR-setup.patch
> new file mode 100644
> index 00000000..69833bdd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-con=
figs-Add-sample-configs-for-the-HSR-setup.patch
> @@ -0,0 +1,96 @@
> +From 65df5cc751c253ff08ecb14d03c59d8e8882f9d6 Mon Sep 17 00:00:00 2001
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Date: Thu, 2 Oct 2025 11:51:53 +0200
> +Subject: [PATCH 12/13] configs: Add sample configs for the HSR setup
> +
> +This is a sample config for the HSR/ DAC mode.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Submitted
> +  Submitted to upstream, waiting approval
> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00017.h=
tml
> +
> + configs/hsr-master.cfg | 30 ++++++++++++++++++++++++++++++
> + configs/hsr-slave.cfg  | 30 ++++++++++++++++++++++++++++++
> + 2 files changed, 60 insertions(+)
> + create mode 100644 configs/hsr-master.cfg
> + create mode 100644 configs/hsr-slave.cfg
> +
> +diff --git a/configs/hsr-master.cfg b/configs/hsr-master.cfg
> +new file mode 100644
> +index 0000000..477b3a2
> +--- /dev/null
> ++++ b/configs/hsr-master.cfg
> +@@ -0,0 +1,30 @@
> ++# HSR example. Two redundant ports, paired. The interfaces implement =
a HC
> ++# consisting of two TC and attached OC for internal synchronisation. =
Both
> ++# ports should use the PTP-clock.
> ++# Can become master.
> ++# See the file, default.cfg, for the complete list of available optio=
ns.
> ++
> ++[global]
> ++clientOnly 0
> ++priority1 127
> ++priority2 128
> ++logAnnounceInterval 0
> ++logSyncInterval 0
> ++path_trace_enabled 1
> ++tc_spanning_tree 1
> ++network_transport L2
> ++delay_mechanism P2P
> ++
> ++profileIdentity 00:0c:cd:01:01:01
> ++dataset_comparison IEC62439-3
> ++use_syslog    0
> ++verbose       1
> ++logging_level 6
> ++
> ++[eth1]
> ++hsr_device hsr0
> ++BMCA redundant_master
> ++
> ++[eth2]
> ++hsr_device hsr0
> ++BMCA redundant_master
> +diff --git a/configs/hsr-slave.cfg b/configs/hsr-slave.cfg
> +new file mode 100644
> +index 0000000..4531011
> +--- /dev/null
> ++++ b/configs/hsr-slave.cfg
> +@@ -0,0 +1,30 @@
> ++# HSR example. Two redundant ports, paired. The interfaces implement =
a HC
> ++# consisting of two TC and attached OC for internal synchronisation. =
Both
> ++# ports should use the PTP-clock.
> ++# Slave only mode.
> ++# See the file, default.cfg, for the complete list of available optio=
ns.
> ++
> ++[global]
> ++clientOnly 1
> ++priority1 255
> ++priority2 255
> ++logAnnounceInterval 0
> ++logSyncInterval 0
> ++path_trace_enabled 1
> ++tc_spanning_tree 1
> ++network_transport L2
> ++delay_mechanism P2P
> ++
> ++profileIdentity 00:0c:cd:01:01:01
> ++dataset_comparison IEC62439-3
> ++use_syslog    0
> ++verbose       1
> ++logging_level 6
> ++
> ++[eth1]
> ++hsr_device hsr0
> ++BMCA redundant_master
> ++
> ++[eth2]
> ++hsr_device hsr0
> ++BMCA redundant_master
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0=
013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch b/meta-ara=
go-distro/recipes-connectivity/linuxptp/linuxptp/0013-configs-Change-p2p_=
dst_mac-to-avoid-IEEE-802.1-reser.patch
> new file mode 100644
> index 00000000..928eb11e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-con=
figs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
> @@ -0,0 +1,47 @@
> +From 53546f24b647adb969316f082652004a67ab50c8 Mon Sep 17 00:00:00 2001
> +From: MD Danish Anwar <danishanwar@ti.com>
> +Date: Wed, 18 Feb 2026 15:45:27 +0530
> +Subject: [PATCH 13/13] configs: Change p2p_dst_mac to avoid IEEE 802.1
> + reserved range
> +
> +The default p2p_dst_mac (01:80:C2:00:00:0E) is in the IEEE 802.1 reser=
ved
> +range which can cause issues with switches and HSR handling. Change it=
 to
> +01:1B:19:00:00:01 which is in the PTP multicast address range.
> +
> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> +---
> +Upstream-Status:
> +Pending
> +  To be posted once Patch 1-12 gets integrated
> +
> + configs/hsr-master.cfg | 1 +
> + configs/hsr-slave.cfg  | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/configs/hsr-master.cfg b/configs/hsr-master.cfg
> +index 477b3a2..6ac8f76 100644
> +--- a/configs/hsr-master.cfg
> ++++ b/configs/hsr-master.cfg
> +@@ -14,6 +14,7 @@ path_trace_enabled 1
> + tc_spanning_tree 1
> + network_transport L2
> + delay_mechanism P2P
> ++p2p_dst_mac 01:1B:19:00:00:01
> +=20
> + profileIdentity 00:0c:cd:01:01:01
> + dataset_comparison IEC62439-3
> +diff --git a/configs/hsr-slave.cfg b/configs/hsr-slave.cfg
> +index 4531011..94ce948 100644
> +--- a/configs/hsr-slave.cfg
> ++++ b/configs/hsr-slave.cfg
> +@@ -14,6 +14,7 @@ path_trace_enabled 1
> + tc_spanning_tree 1
> + network_transport L2
> + delay_mechanism P2P
> ++p2p_dst_mac 01:1B:19:00:00:01
> +=20
> + profileIdentity 00:0c:cd:01:01:01
> + dataset_comparison IEC62439-3
> +--=20
> +2.34.1
> +
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%=
.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bb=
append
> new file mode 100644
> index 00000000..09958c5a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappe=
nd
> @@ -0,0 +1,4 @@
> +LINUXPTP_ARAGO =3D ""
> +LINUXPTP_ARAGO:arago =3D "linuxptp-arago.inc"
> +
> +require ${LINUXPTP_ARAGO}
>=20
> base-commit: 3230bc79957bd71775e0273ea1f4eab8d676123a
> --=20
> 2.34.1


