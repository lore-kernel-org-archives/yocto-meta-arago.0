Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5E693529E8
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 17:20:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UHIeXK035266
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 12:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572455920;
	bh=7+GscBF3cZXPsA6RGFihsOu2VMtBdd6KoWkqOy34Q50=;
	h=From:To:CC:Subject:Date;
	b=DJWI5et+Z7ltgaw9tPUuksHeByNYlujIZfnW0JTcvhYLJEgD/krTjYaa3QArQXej7
	6BQ+VVrmb/pVKubIAXR6SgVyOgMWF8XVkTQfANOHM7EvPKR94WQP7iASdQiZc+AqL1
	QBFzBFCZyyEgyEMcuig4uD0QkRT93irMAleSTI6U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UHIdj6072350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 12:18:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 12:18:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 12:18:27 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UHIdOf089812;
	Wed, 30 Oct 2019 12:18:39 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1iPrcE-0000Ys-VO; Wed, 30 Oct 2019 13:18:38 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 13:18:36 -0400
Message-ID: <1572455916-2125-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v2] iproute2: soft taprio: add patches for taprio
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
X-List-Received-Date: Wed, 30 Oct 2019 17:20:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: add Upstream-Status

 .../iproute2/0001-utils-Implement-get_s64.patch    |  65 +++
 ...-helper-to-retrieve-a-__s64-from-a-netlin.patch |  40 ++
 ...Add-helper-for-getting-a-__s32-from-netli.patch |  37 ++
 ...port-for-configuring-the-taprio-scheduler.patch | 489 +++++++++++++++++++++
 .../0005-taprio-Add-manpage-for-tc-taprio-8.patch  | 169 +++++++
 ...taprio-Add-support-for-changing-schedules.patch | 151 +++++++
 ...support-for-cycle_time-and-cycle_time_ext.patch | 148 +++++++
 .../iproute2/0008-utils-Fix-get_s64-function.patch |  35 ++
 ...0009-taprio-Add-support-for-setting-flags.patch |  78 ++++
 ...prio-add-support-for-setting-txtime_delay.patch |  97 ++++
 .../0011-tc-taprio-Update-documentation.patch      |  81 ++++
 ...sync-pkt_sched-header-with-kernel-version.patch | 131 ++++++
 .../iproute2/iproute2_4.19.0.bbappend              |  14 +-
 13 files changed, 1534 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-utils-Implement-get_s64.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-include-Add-helper-to-retrieve-a-__s64-from-a-netlin.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-libnetlink-Add-helper-for-getting-a-__s32-from-netli.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-tc-Add-support-for-configuring-the-taprio-scheduler.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0005-taprio-Add-manpage-for-tc-taprio-8.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0006-taprio-Add-support-for-changing-schedules.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0007-taprio-Add-support-for-cycle_time-and-cycle_time_ext.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0008-utils-Fix-get_s64-function.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0009-taprio-Add-support-for-setting-flags.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0010-taprio-add-support-for-setting-txtime_delay.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0011-tc-taprio-Update-documentation.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0012-sync-pkt_sched-header-with-kernel-version.patch

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-utils-Implement-get_s64.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-utils-Implement-get_s64.patch
new file mode 100644
index 0000000..9e799ab
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-utils-Implement-get_s64.patch
@@ -0,0 +1,65 @@
+From 7e4397dff47438be65fdf90dc4e51b763797d201 Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Fri, 5 Oct 2018 16:25:17 -0700
+Subject: [PATCH 01/12] utils: Implement get_s64()
+
+Upstream-Status: Backport
+commit a066bac8a2775bc43d54ae7173057f75f543c44b upstream.
+
+Add this helper to read signed 64-bit integers from a string.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ include/utils.h |  1 +
+ lib/utils.c     | 21 +++++++++++++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/include/utils.h b/include/utils.h
+index 8cb4349e..58574a05 100644
+--- a/include/utils.h
++++ b/include/utils.h
+@@ -139,6 +139,7 @@ int get_time_rtt(unsigned *val, const char *arg, int *raw);
+ #define get_byte get_u8
+ #define get_ushort get_u16
+ #define get_short get_s16
++int get_s64(__s64 *val, const char *arg, int base);
+ int get_u64(__u64 *val, const char *arg, int base);
+ int get_u32(__u32 *val, const char *arg, int base);
+ int get_s32(__s32 *val, const char *arg, int base);
+diff --git a/lib/utils.c b/lib/utils.c
+index ad27f78c..be29530f 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -384,6 +384,27 @@ int get_u8(__u8 *val, const char *arg, int base)
+ 	return 0;
+ }
+ 
++int get_s64(__s64 *val, const char *arg, int base)
++{
++	long res;
++	char *ptr;
++
++	errno = 0;
++
++	if (!arg || !*arg)
++		return -1;
++	res = strtoll(arg, &ptr, base);
++	if (!ptr || ptr == arg || *ptr)
++		return -1;
++	if ((res == LLONG_MIN || res == LLONG_MAX) && errno == ERANGE)
++		return -1;
++	if (res > INT64_MAX || res < INT64_MIN)
++		return -1;
++
++	*val = res;
++	return 0;
++}
++
+ int get_s32(__s32 *val, const char *arg, int base)
+ {
+ 	long res;
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-include-Add-helper-to-retrieve-a-__s64-from-a-netlin.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-include-Add-helper-to-retrieve-a-__s64-from-a-netlin.patch
new file mode 100644
index 0000000..1098145
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-include-Add-helper-to-retrieve-a-__s64-from-a-netlin.patch
@@ -0,0 +1,40 @@
+From 6d0bcdd9d0283768798227f4046414ed7da42047 Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Fri, 5 Oct 2018 16:25:18 -0700
+Subject: [PATCH 02/12] include: Add helper to retrieve a __s64 from a netlink
+ msg
+
+Upstream-Status: Backport
+commit de63cd90444ac9fdf238f950c16cafe351846691 upstream.
+
+This allows signed 64-bit integers to be retrieved from a netlink
+message.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ include/libnetlink.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/include/libnetlink.h b/include/libnetlink.h
+index 9d9249e6..ffc49e56 100644
+--- a/include/libnetlink.h
++++ b/include/libnetlink.h
+@@ -185,6 +185,13 @@ static inline __u64 rta_getattr_u64(const struct rtattr *rta)
+ 	memcpy(&tmp, RTA_DATA(rta), sizeof(__u64));
+ 	return tmp;
+ }
++static inline __s64 rta_getattr_s64(const struct rtattr *rta)
++{
++	__s64 tmp;
++
++	memcpy(&tmp, RTA_DATA(rta), sizeof(tmp));
++	return tmp;
++}
+ static inline const char *rta_getattr_str(const struct rtattr *rta)
+ {
+ 	return (const char *)RTA_DATA(rta);
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-libnetlink-Add-helper-for-getting-a-__s32-from-netli.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-libnetlink-Add-helper-for-getting-a-__s32-from-netli.patch
new file mode 100644
index 0000000..983e901
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-libnetlink-Add-helper-for-getting-a-__s32-from-netli.patch
@@ -0,0 +1,37 @@
+From ca37dce0e9c50645a3473dc942a33478eb79378d Mon Sep 17 00:00:00 2001
+From: Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>
+Date: Fri, 5 Oct 2018 16:25:19 -0700
+Subject: [PATCH 03/12] libnetlink: Add helper for getting a __s32 from netlink
+ msgs
+
+Upstream-Status: Backport
+commit d791f3ad869659da4b151eded060840a88d9656a upstream.
+
+This function retrieves a signed 32-bit integer from a netlink message
+and returns it.
+
+Signed-off-by: Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ include/libnetlink.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/libnetlink.h b/include/libnetlink.h
+index ffc49e56..c44c3c72 100644
+--- a/include/libnetlink.h
++++ b/include/libnetlink.h
+@@ -185,6 +185,10 @@ static inline __u64 rta_getattr_u64(const struct rtattr *rta)
+ 	memcpy(&tmp, RTA_DATA(rta), sizeof(__u64));
+ 	return tmp;
+ }
++static inline __s32 rta_getattr_s32(const struct rtattr *rta)
++{
++	return *(__s32 *)RTA_DATA(rta);
++}
+ static inline __s64 rta_getattr_s64(const struct rtattr *rta)
+ {
+ 	__s64 tmp;
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-tc-Add-support-for-configuring-the-taprio-scheduler.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-tc-Add-support-for-configuring-the-taprio-scheduler.patch
new file mode 100644
index 0000000..798b42e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-tc-Add-support-for-configuring-the-taprio-scheduler.patch
@@ -0,0 +1,489 @@
+From b53ed00cc819a9d57983f48a9fe8d02ec3b50fca Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Fri, 5 Oct 2018 16:25:21 -0700
+Subject: [PATCH 04/12] tc: Add support for configuring the taprio scheduler
+
+Upstream-Status: Backport
+commit 0dd16449356f7ba88e5374392b577f0504b3f025 upstream.
+
+This traffic scheduler allows traffic classes states (transmission
+allowed/not allowed, in the simplest case) to be scheduled, according
+to a pre-generated time sequence. This is the basis of the IEEE
+802.1Qbv specification.
+
+Example configuration:
+
+tc qdisc replace dev enp3s0 parent root handle 100 taprio \
+          num_tc 3 \
+	  map 2 2 1 0 2 2 2 2 2 2 2 2 2 2 2 2 \
+	  queues 1@0 1@1 2@2 \
+	  base-time 1528743495910289987 \
+	  sched-entry S 01 300000 \
+	  sched-entry S 02 300000 \
+	  sched-entry S 04 300000 \
+	  clockid CLOCK_TAI
+
+The configuration format is similar to mqprio. The main difference is
+the presence of a schedule, built by multiple "sched-entry"
+definitions, each entry has the following format:
+
+     sched-entry <CMD> <GATE MASK> <INTERVAL>
+
+The only supported <CMD> is "S", which means "SetGateStates",
+following the IEEE 802.1Qbv-2015 definition (Table 8-6). <GATE MASK>
+is a bitmask where each bit is a associated with a traffic class, so
+bit 0 (the least significant bit) being "on" means that traffic class
+0 is "active" for that schedule entry. <INTERVAL> is a time duration
+in nanoseconds that specifies for how long that state defined by <CMD>
+and <GATE MASK> should be held before moving to the next entry.
+
+This schedule is circular, that is, after the last entry is executed
+it starts from the first one, indefinitely.
+
+The other parameters can be defined as follows:
+
+ - base-time: specifies the instant when the schedule starts, if
+  'base-time' is a time in the past, the schedule will start at
+
+ 	      base-time + (N * cycle-time)
+
+   where N is the smallest integer so the resulting time is greater
+   than "now", and "cycle-time" is the sum of all the intervals of the
+   entries in the schedule;
+
+ - clockid: specifies the reference clock to be used;
+
+The parameters should be similar to what the IEEE 802.1Q family of
+specification defines.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ tc/Makefile   |   1 +
+ tc/q_taprio.c | 400 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 401 insertions(+)
+ create mode 100644 tc/q_taprio.c
+
+diff --git a/tc/Makefile b/tc/Makefile
+index 5a1a7ff9..25a28284 100644
+--- a/tc/Makefile
++++ b/tc/Makefile
+@@ -74,6 +74,7 @@ TCMODULES += e_bpf.o
+ TCMODULES += f_matchall.o
+ TCMODULES += q_cbs.o
+ TCMODULES += q_etf.o
++TCMODULES += q_taprio.o
+ 
+ TCSO :=
+ ifeq ($(TC_CONFIG_ATM),y)
+diff --git a/tc/q_taprio.c b/tc/q_taprio.c
+new file mode 100644
+index 00000000..562dacb8
+--- /dev/null
++++ b/tc/q_taprio.c
+@@ -0,0 +1,400 @@
++/*
++ * q_taprio.c	Time Aware Priority Scheduler
++ *
++ *		This program is free software; you can redistribute it and/or
++ *		modify it under the terms of the GNU General Public License
++ *		as published by the Free Software Foundation; either version
++ *		2 of the License, or (at your option) any later version.
++ *
++ * Authors:	Vinicius Costa Gomes <vinicius.gomes@intel.com>
++ * 		Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <syslog.h>
++#include <fcntl.h>
++#include <inttypes.h>
++#include <sys/socket.h>
++#include <netinet/in.h>
++#include <arpa/inet.h>
++#include <string.h>
++
++#include "utils.h"
++#include "tc_util.h"
++#include "list.h"
++
++struct sched_entry {
++	struct list_head list;
++	uint32_t index;
++	uint32_t interval;
++	uint32_t gatemask;
++	uint8_t cmd;
++};
++
++#define CLOCKID_INVALID (-1)
++static const struct static_clockid {
++	const char *name;
++	clockid_t clockid;
++} clockids_sysv[] = {
++	{ "REALTIME", CLOCK_REALTIME },
++	{ "TAI", CLOCK_TAI },
++	{ "BOOTTIME", CLOCK_BOOTTIME },
++	{ "MONOTONIC", CLOCK_MONOTONIC },
++	{ NULL }
++};
++
++static void explain(void)
++{
++	fprintf(stderr, "Usage: ... taprio clockid CLOCKID\n");
++	fprintf(stderr, "                  [num_tc NUMBER] [map P0 P1 ...] ");
++	fprintf(stderr, "                  [queues COUNT@OFFSET COUNT@OFFSET COUNT@OFFSET ...] ");
++	fprintf(stderr, "                  [ [sched-entry index cmd gate-mask interval] ... ] ");
++	fprintf(stderr, "                  [base-time time] ");
++	fprintf(stderr, "\nCLOCKID must be a valid SYS-V id (i.e. CLOCK_TAI)");
++	fprintf(stderr, "\n");
++}
++
++static void explain_clockid(const char *val)
++{
++	fprintf(stderr, "taprio: illegal value for \"clockid\": \"%s\".\n", val);
++	fprintf(stderr, "It must be a valid SYS-V id (i.e. CLOCK_TAI)\n");
++}
++
++static int get_clockid(__s32 *val, const char *arg)
++{
++	const struct static_clockid *c;
++
++	/* Drop the CLOCK_ prefix if that is being used. */
++	if (strcasestr(arg, "CLOCK_") != NULL)
++		arg += sizeof("CLOCK_") - 1;
++
++	for (c = clockids_sysv; c->name; c++) {
++		if (strcasecmp(c->name, arg) == 0) {
++			*val = c->clockid;
++
++			return 0;
++		}
++	}
++
++	return -1;
++}
++
++static const char* get_clock_name(clockid_t clockid)
++{
++	const struct static_clockid *c;
++
++	for (c = clockids_sysv; c->name; c++) {
++		if (clockid == c->clockid)
++			return c->name;
++	}
++
++	return "invalid";
++}
++
++static const char *entry_cmd_to_str(__u8 cmd)
++{
++	switch (cmd) {
++	case TC_TAPRIO_CMD_SET_GATES:
++		return "S";
++	default:
++		return "Invalid";
++	}
++}
++
++static int str_to_entry_cmd(const char *str)
++{
++	if (strcmp(str, "S") == 0)
++		return TC_TAPRIO_CMD_SET_GATES;
++
++	return -1;
++}
++
++static int add_sched_list(struct list_head *sched_entries, struct nlmsghdr *n)
++{
++	struct sched_entry *e;
++
++	list_for_each_entry(e, sched_entries, list) {
++		struct rtattr *a;
++
++		a = addattr_nest(n, 1024, TCA_TAPRIO_SCHED_ENTRY);
++
++		addattr_l(n, 1024, TCA_TAPRIO_SCHED_ENTRY_CMD, &e->cmd, sizeof(e->cmd));
++		addattr_l(n, 1024, TCA_TAPRIO_SCHED_ENTRY_GATE_MASK, &e->gatemask, sizeof(e->gatemask));
++		addattr_l(n, 1024, TCA_TAPRIO_SCHED_ENTRY_INTERVAL, &e->interval, sizeof(e->interval));
++
++		addattr_nest_end(n, a);
++	}
++
++	return 0;
++}
++
++static void explain_sched_entry(void)
++{
++	fprintf(stderr, "Usage: ... taprio ... sched-entry <cmd> <gate mask> <interval>\n");
++}
++
++static struct sched_entry *create_entry(uint32_t gatemask, uint32_t interval, uint8_t cmd)
++{
++	struct sched_entry *e;
++
++	e = calloc(1, sizeof(*e));
++	if (!e)
++		return NULL;
++
++	e->gatemask = gatemask;
++	e->interval = interval;
++	e->cmd = cmd;
++
++	return e;
++}
++
++static int taprio_parse_opt(struct qdisc_util *qu, int argc,
++			    char **argv, struct nlmsghdr *n, const char *dev)
++{
++	__s32 clockid = CLOCKID_INVALID;
++	struct tc_mqprio_qopt opt = { };
++	struct list_head sched_entries;
++	struct rtattr *tail;
++	__s64 base_time = 0;
++	int err, idx;
++
++	INIT_LIST_HEAD(&sched_entries);
++
++	while (argc > 0) {
++		idx = 0;
++		if (strcmp(*argv, "num_tc") == 0) {
++			NEXT_ARG();
++			if (get_u8(&opt.num_tc, *argv, 10)) {
++				fprintf(stderr, "Illegal \"num_tc\"\n");
++				return -1;
++			}
++		} else if (strcmp(*argv, "map") == 0) {
++			while (idx < TC_QOPT_MAX_QUEUE && NEXT_ARG_OK()) {
++				NEXT_ARG();
++				if (get_u8(&opt.prio_tc_map[idx], *argv, 10)) {
++					PREV_ARG();
++					break;
++				}
++				idx++;
++			}
++			for ( ; idx < TC_QOPT_MAX_QUEUE; idx++)
++				opt.prio_tc_map[idx] = 0;
++		} else if (strcmp(*argv, "queues") == 0) {
++			char *tmp, *tok;
++
++			while (idx < TC_QOPT_MAX_QUEUE && NEXT_ARG_OK()) {
++				NEXT_ARG();
++
++				tmp = strdup(*argv);
++				if (!tmp)
++					break;
++
++				tok = strtok(tmp, "@");
++				if (get_u16(&opt.count[idx], tok, 10)) {
++					free(tmp);
++					PREV_ARG();
++					break;
++				}
++				tok = strtok(NULL, "@");
++				if (get_u16(&opt.offset[idx], tok, 10)) {
++					free(tmp);
++					PREV_ARG();
++					break;
++				}
++				free(tmp);
++				idx++;
++			}
++		} else if (strcmp(*argv, "sched-entry") == 0) {
++			uint32_t mask, interval;
++			struct sched_entry *e;
++			uint8_t cmd;
++
++			NEXT_ARG();
++			err = str_to_entry_cmd(*argv);
++			if (err < 0) {
++				explain_sched_entry();
++				return  -1;
++			}
++			cmd = err;
++
++			NEXT_ARG();
++			if (get_u32(&mask, *argv, 16)) {
++				explain_sched_entry();
++				return -1;
++			}
++
++			NEXT_ARG();
++			if (get_u32(&interval, *argv, 0)) {
++				explain_sched_entry();
++				return -1;
++			}
++
++			e = create_entry(mask, interval, cmd);
++			if (!e) {
++				fprintf(stderr, "taprio: not enough memory for new schedule entry\n");
++				return -1;
++			}
++
++			list_add_tail(&e->list, &sched_entries);
++
++		} else if (strcmp(*argv, "base-time") == 0) {
++			NEXT_ARG();
++			if (get_s64(&base_time, *argv, 10)) {
++				PREV_ARG();
++				break;
++			}
++		} else if (strcmp(*argv, "clockid") == 0) {
++			NEXT_ARG();
++			if (clockid != CLOCKID_INVALID) {
++				fprintf(stderr, "taprio: duplicate \"clockid\" specification\n");
++				return -1;
++			}
++			if (get_clockid(&clockid, *argv)) {
++				explain_clockid(*argv);
++				return -1;
++			}
++		} else if (strcmp(*argv, "help") == 0) {
++			explain();
++			return -1;
++		} else {
++			fprintf(stderr, "Unknown argument\n");
++			return -1;
++		}
++		argc--; argv++;
++	}
++
++	tail = NLMSG_TAIL(n);
++	addattr_l(n, 1024, TCA_OPTIONS, NULL, 0);
++
++	if (opt.num_tc > 0)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_PRIOMAP, &opt, sizeof(opt));
++
++	if (base_time)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_BASE_TIME, &base_time, sizeof(base_time));
++
++	addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CLOCKID, &clockid, sizeof(clockid));
++
++	if (!list_empty(&sched_entries)) {
++		struct rtattr *entry_list;
++		entry_list = addattr_nest(n, 1024, TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST | NLA_F_NESTED);
++
++		err = add_sched_list(&sched_entries, n);
++		if (err < 0) {
++			fprintf(stderr, "Could not add schedule to netlink message\n");
++			return -1;
++		}
++
++		addattr_nest_end(n, entry_list);
++	}
++
++	tail->rta_len = (void *) NLMSG_TAIL(n) - (void *) tail;
++
++	return 0;
++}
++
++static int print_sched_list(FILE *f, struct rtattr *list)
++{
++	struct rtattr *item;
++	int rem;
++
++	if (list == NULL)
++		return 0;
++
++	rem = RTA_PAYLOAD(list);
++
++	open_json_array(PRINT_JSON, "schedule");
++
++	for (item = RTA_DATA(list); RTA_OK(item, rem); item = RTA_NEXT(item, rem)) {
++		struct rtattr *tb[TCA_TAPRIO_SCHED_ENTRY_MAX + 1];
++		__u32 index = 0, gatemask = 0, interval = 0;
++		__u8 command = 0;
++
++		parse_rtattr_nested(tb, TCA_TAPRIO_SCHED_ENTRY_MAX, item);
++
++		if (tb[TCA_TAPRIO_SCHED_ENTRY_INDEX])
++			index = rta_getattr_u32(tb[TCA_TAPRIO_SCHED_ENTRY_INDEX]);
++
++		if (tb[TCA_TAPRIO_SCHED_ENTRY_CMD])
++			command = rta_getattr_u8(tb[TCA_TAPRIO_SCHED_ENTRY_CMD]);
++
++		if (tb[TCA_TAPRIO_SCHED_ENTRY_GATE_MASK])
++			gatemask = rta_getattr_u32(tb[TCA_TAPRIO_SCHED_ENTRY_GATE_MASK]);
++
++		if (tb[TCA_TAPRIO_SCHED_ENTRY_INTERVAL])
++			interval = rta_getattr_u32(tb[TCA_TAPRIO_SCHED_ENTRY_INTERVAL]);
++
++		open_json_object(NULL);
++		print_uint(PRINT_ANY, "index", "\tindex %u", index);
++		print_string(PRINT_ANY, "cmd", " cmd %s", entry_cmd_to_str(command));
++		print_0xhex(PRINT_ANY, "gatemask", " gatemask %#x", gatemask);
++		print_uint(PRINT_ANY, "interval", " interval %u", interval);
++		close_json_object();
++
++		print_string(PRINT_FP, NULL, "%s", _SL_);
++	}
++
++	close_json_array(PRINT_ANY, "");
++
++	return 0;
++}
++
++static int taprio_print_opt(struct qdisc_util *qu, FILE *f, struct rtattr *opt)
++{
++	struct rtattr *tb[TCA_TAPRIO_ATTR_MAX + 1];
++	struct tc_mqprio_qopt *qopt = 0;
++	__s32 clockid = CLOCKID_INVALID;
++	__s64 base_time = 0;
++	int i;
++
++	if (opt == NULL)
++		return 0;
++
++	parse_rtattr_nested(tb, TCA_TAPRIO_ATTR_MAX, opt);
++
++	if (tb[TCA_TAPRIO_ATTR_PRIOMAP] == NULL)
++		return -1;
++
++	qopt = RTA_DATA(tb[TCA_TAPRIO_ATTR_PRIOMAP]);
++
++	print_uint(PRINT_ANY, "tc", "tc %u ", qopt->num_tc);
++
++	open_json_array(PRINT_ANY, "map");
++	for (i = 0; i <= TC_PRIO_MAX; i++)
++		print_uint(PRINT_ANY, NULL, " %u", qopt->prio_tc_map[i]);
++	close_json_array(PRINT_ANY, "");
++
++	print_string(PRINT_FP, NULL, "%s", _SL_);
++
++	open_json_array(PRINT_ANY, "queues");
++	for (i = 0; i < qopt->num_tc; i++) {
++		open_json_object(NULL);
++		print_uint(PRINT_ANY, "offset", " offset %u", qopt->offset[i]);
++		print_uint(PRINT_ANY, "count", " count %u", qopt->count[i]);
++		close_json_object();
++	}
++	close_json_array(PRINT_ANY, "");
++
++	print_string(PRINT_FP, NULL, "%s", _SL_);
++
++	if (tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME])
++		base_time = rta_getattr_s64(tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME]);
++
++	if (tb[TCA_TAPRIO_ATTR_SCHED_CLOCKID])
++		clockid = rta_getattr_s32(tb[TCA_TAPRIO_ATTR_SCHED_CLOCKID]);
++
++	print_string(PRINT_ANY, "clockid", "clockid %s", get_clock_name(clockid));
++
++	print_lluint(PRINT_ANY, "base_time", " base-time %lld", base_time);
++
++	print_string(PRINT_FP, NULL, "%s", _SL_);
++
++	return print_sched_list(f, tb[TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST]);
++}
++
++struct qdisc_util taprio_qdisc_util = {
++	.id		= "taprio",
++	.parse_qopt	= taprio_parse_opt,
++	.print_qopt	= taprio_print_opt,
++};
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0005-taprio-Add-manpage-for-tc-taprio-8.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0005-taprio-Add-manpage-for-tc-taprio-8.patch
new file mode 100644
index 0000000..78a2e1f
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0005-taprio-Add-manpage-for-tc-taprio-8.patch
@@ -0,0 +1,169 @@
+From b21190927e151761f138805cf3c208f8d28e8314 Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Fri, 5 Oct 2018 16:25:22 -0700
+Subject: [PATCH 05/12] taprio: Add manpage for tc-taprio(8)
+
+Upstream-Status: Backport
+commit 579acb4bc52f84c629df5fcd2f9a054f41b48c57 upstream.
+
+This documents the parameters and provides an example of usage.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ man/man8/tc-taprio.8 | 142 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 142 insertions(+)
+ create mode 100644 man/man8/tc-taprio.8
+
+diff --git a/man/man8/tc-taprio.8 b/man/man8/tc-taprio.8
+new file mode 100644
+index 00000000..92055b43
+--- /dev/null
++++ b/man/man8/tc-taprio.8
+@@ -0,0 +1,142 @@
++.TH TAPRIO 8 "25 Sept 2018" "iproute2" "Linux"
++.SH NAME
++TAPRIO \- Time Aware Priority Shaper
++.SH SYNOPSIS
++.B tc qdisc ... dev
++dev
++.B parent
++classid
++.B [ handle
++major:
++.B ] taprio num_tc
++tcs
++.ti +8
++.B map
++P0 P1 P2 ...
++.B queues
++count1@offset1 count2@offset2 ...
++.ti +8
++.B base-time
++base-time
++.B clockid
++clockid
++.ti +8
++.B sched-entry
++<command 1> <gate mask 1> <interval 1>
++.ti +8
++.B sched-entry
++<command 2> <gate mask 2> <interval 2>
++.ti +8
++.B sched-entry
++<command 3> <gate mask 3> <interval 3>
++.ti +8
++.B sched-entry
++<command N> <gate mask N> <interval N>
++
++.SH DESCRIPTION
++The TAPRIO qdisc implements a simplified version of the scheduling
++state machine defined by IEEE 802.1Q-2018 Section 8.6.9, which allows
++configuration of a sequence of gate states, where each gate state
++allows outgoing traffic for a subset (potentially empty) of traffic
++classes.
++
++How traffic is mapped to different hardware queues is similar to
++.BR mqprio(8)
++and so the
++.B map
++and
++.Q queues
++parameters have the same meaning.
++
++The other parameters specify the schedule, and at what point in time
++it should start (it can behave as the schedule started in the past).
++
++.SH PARAMETERS
++.TP
++num_tc
++.BR
++Number of traffic classes to use. Up to 16 classes supported.
++
++.TP
++map
++.br
++The priority to traffic class map. Maps priorities 0..15 to a specified
++traffic class. See
++.BR mqprio(8)
++for more details.
++
++.TP
++queues
++.br
++Provide count and offset of queue range for each traffic class. In the
++format,
++.B count@offset.
++Queue ranges for each traffic classes cannot overlap and must be a
++contiguous range of queues.
++
++.TP
++base-time
++.br
++Specifies the instant in nanoseconds, using the reference of
++.B clockid,
++defining the time when the schedule starts. If 'base-time' is a time
++in the past, the schedule will start at
++
++base-time + (N * cycle-time)
++
++where N is the smallest integer so the resulting time is greater than
++"now", and "cycle-time" is the sum of all the intervals of the entries
++in the schedule;
++
++.TP
++clockid
++.br
++Specifies the clock to be used by qdisc's internal timer for measuring
++time and scheduling events.
++
++.TP
++sched-entry
++.br
++There may multiple
++.B sched-entry
++parameters in a single schedule. Each one has the
++
++sched-entry <command> <gatemask> <interval>
++
++format. The only supported <command> is "S", which
++means "SetGateStates", following the IEEE 802.1Q-2018 definition
++(Table 8-7). <gate mask> is a bitmask where each bit is a associated
++with a traffic class, so bit 0 (the least significant bit) being "on"
++means that traffic class 0 is "active" for that schedule entry.
++<interval> is a time duration, in nanoseconds, that specifies for how
++long that state defined by <command> and <gate mask> should be held
++before moving to the next entry.
++
++.SH EXAMPLES
++
++The following example shows how an traffic schedule with three traffic
++classes ("num_tc 3"), which are separated different traffic classes,
++we are going to call these TC 0, TC 1 and TC 2. We could read the
++"map" parameter below as: traffic with priority 3 is classified as TC
++0, priority 2 is classified as TC 1 and the rest is classified as TC
++2.
++
++The schedule will start at instant 1528743495910289987 using the
++reference CLOCK_TAI. The schedule is composed of three entries each of
++300us duration.
++
++.EX
++# tc qdisc replace dev eth0 parent root handle 100 taprio \\
++              num_tc 3 \\
++              map 2 2 1 0 2 2 2 2 2 2 2 2 2 2 2 2 \\
++              queues 1@0 1@1 2@2 \\
++              base-time 1528743495910289987 \\
++              sched-entry S 01 300000 \\
++              sched-entry S 02 300000 \\
++              sched-entry S 04 300000 \\
++              clockid CLOCK_TAI
++.EE
++
++
++.SH AUTHORS
++Vinicius Costa Gomes <vinicius.gomes@intel.com>
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0006-taprio-Add-support-for-changing-schedules.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0006-taprio-Add-support-for-changing-schedules.patch
new file mode 100644
index 0000000..49fea1b
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0006-taprio-Add-support-for-changing-schedules.patch
@@ -0,0 +1,151 @@
+From 3a650c67b63e502989fccdabf8c02a575bdf2116 Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Mon, 29 Apr 2019 15:52:18 -0700
+Subject: [PATCH 06/12] taprio: Add support for changing schedules
+
+Upstream-Status: Backport
+commit 602fae856d80bbaa365fd0421e3f2c2417ea804f upstream.
+
+This allows for a new schedule to be specified during runtime, without
+removing the current one.
+
+For that, the semantics of the 'tc qdisc change' operation in the
+context of taprio is that if "change" is called and there is a running
+schedule, a new schedule is created and the base-time (let's call it
+X) of this new schedule is used so at instant X, it becomes the
+"current" schedule. So, in short, "change" doesn't change the current
+schedule, it creates a new one and sets it up to it becomes the
+current one at some point.
+
+In IEEE 802.1Q terms, it means that we have support for the
+"Oper" (current and read-only) and "Admin" (future and mutable)
+schedules.
+
+Example of creating the first schedule, then adding a new one:
+
+(1)
+tc qdisc add dev IFACE parent root handle 100 taprio \
+      	      num_tc 1 \
+	      map 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \
+	      queues 1@0 \
+	      sched-entry S 0x1 1000000 \
+	      sched-entry S 0x0 2000000 \
+	      sched-entry S 0x1 3000000 \
+	      sched-entry S 0x0 4000000 \
+	      base-time 100000000 \
+	      clockid CLOCK_TAI
+
+(2)
+tc qdisc change dev IFACE parent root handle 100 taprio \
+	      base-time 7500000000000 \
+	      sched-entry S 0x0 5000000 \
+              sched-entry S 0x1 5000000 \
+
+It was necessary to fix a bug, so the clockid doesn't need to be
+specified when changing the schedule.
+
+Most of the changes are related to make it easier to reuse the same
+function for printing the "admin" and "oper" schedules.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ tc/q_taprio.c | 42 +++++++++++++++++++++++++++++++++---------
+ 1 file changed, 33 insertions(+), 9 deletions(-)
+
+diff --git a/tc/q_taprio.c b/tc/q_taprio.c
+index 562dacb8..20804fc2 100644
+--- a/tc/q_taprio.c
++++ b/tc/q_taprio.c
+@@ -268,14 +268,15 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	tail = NLMSG_TAIL(n);
+ 	addattr_l(n, 1024, TCA_OPTIONS, NULL, 0);
+ 
++	if (clockid != CLOCKID_INVALID)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CLOCKID, &clockid, sizeof(clockid));
++
+ 	if (opt.num_tc > 0)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_PRIOMAP, &opt, sizeof(opt));
+ 
+ 	if (base_time)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_BASE_TIME, &base_time, sizeof(base_time));
+ 
+-	addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CLOCKID, &clockid, sizeof(clockid));
+-
+ 	if (!list_empty(&sched_entries)) {
+ 		struct rtattr *entry_list;
+ 		entry_list = addattr_nest(n, 1024, TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST | NLA_F_NESTED);
+@@ -306,6 +307,8 @@ static int print_sched_list(FILE *f, struct rtattr *list)
+ 
+ 	open_json_array(PRINT_JSON, "schedule");
+ 
++	print_string(PRINT_FP, NULL, "%s", _SL_);
++
+ 	for (item = RTA_DATA(list); RTA_OK(item, rem); item = RTA_NEXT(item, rem)) {
+ 		struct rtattr *tb[TCA_TAPRIO_SCHED_ENTRY_MAX + 1];
+ 		__u32 index = 0, gatemask = 0, interval = 0;
+@@ -340,12 +343,25 @@ static int print_sched_list(FILE *f, struct rtattr *list)
+ 	return 0;
+ }
+ 
++static int print_schedule(FILE *f, struct rtattr **tb)
++{
++	int64_t base_time = 0;
++
++	if (tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME])
++		base_time = rta_getattr_s64(tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME]);
++
++	print_lluint(PRINT_ANY, "base_time", "\tbase-time %lld", base_time);
++
++	print_sched_list(f, tb[TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST]);
++
++	return 0;
++}
++
+ static int taprio_print_opt(struct qdisc_util *qu, FILE *f, struct rtattr *opt)
+ {
+ 	struct rtattr *tb[TCA_TAPRIO_ATTR_MAX + 1];
+ 	struct tc_mqprio_qopt *qopt = 0;
+ 	__s32 clockid = CLOCKID_INVALID;
+-	__s64 base_time = 0;
+ 	int i;
+ 
+ 	if (opt == NULL)
+@@ -378,19 +394,27 @@ static int taprio_print_opt(struct qdisc_util *qu, FILE *f, struct rtattr *opt)
+ 
+ 	print_string(PRINT_FP, NULL, "%s", _SL_);
+ 
+-	if (tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME])
+-		base_time = rta_getattr_s64(tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME]);
+-
+ 	if (tb[TCA_TAPRIO_ATTR_SCHED_CLOCKID])
+ 		clockid = rta_getattr_s32(tb[TCA_TAPRIO_ATTR_SCHED_CLOCKID]);
+ 
+ 	print_string(PRINT_ANY, "clockid", "clockid %s", get_clock_name(clockid));
+ 
+-	print_lluint(PRINT_ANY, "base_time", " base-time %lld", base_time);
++	print_schedule(f, tb);
+ 
+-	print_string(PRINT_FP, NULL, "%s", _SL_);
++	if (tb[TCA_TAPRIO_ATTR_ADMIN_SCHED]) {
++		struct rtattr *t[TCA_TAPRIO_ATTR_MAX + 1];
++
++		parse_rtattr_nested(t, TCA_TAPRIO_ATTR_MAX,
++				    tb[TCA_TAPRIO_ATTR_ADMIN_SCHED]);
+ 
+-	return print_sched_list(f, tb[TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST]);
++		open_json_object(NULL);
++
++		print_schedule(f, t);
++
++		close_json_object();
++	}
++
++	return 0;
+ }
+ 
+ struct qdisc_util taprio_qdisc_util = {
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0007-taprio-Add-support-for-cycle_time-and-cycle_time_ext.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0007-taprio-Add-support-for-cycle_time-and-cycle_time_ext.patch
new file mode 100644
index 0000000..cd50d4b
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0007-taprio-Add-support-for-cycle_time-and-cycle_time_ext.patch
@@ -0,0 +1,148 @@
+From 538fe8f7e208c7ed7c9af191c25b3c48adb348c3 Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Mon, 29 Apr 2019 15:52:19 -0700
+Subject: [PATCH 07/12] taprio: Add support for cycle_time and
+ cycle_time_extension
+
+Upstream-Status: Backport
+commit 92f4b6032e7971d9b0247d7370c08cae2f1c58f9 upstream.
+
+This allows a cycle-time and a cycle-time-extension to be specified.
+
+Specifying a cycle-time will truncate that cycle, so when that instant
+is reached, the cycle will start from its beginning.
+
+A cycle-time-extension may cause the last entry of a cycle, just
+before the start of a new schedule (the base-time of the "admin"
+schedule) to be extended by at maximum "cycle-time-extension"
+nanoseconds. The idea of this feauture, as described by the IEEE
+802.1Q, is too avoid too narrow gate states.
+
+Example:
+
+tc qdisc change dev IFACE parent root handle 100 taprio \
+	      sched-entry S 0x1 1000000 \
+	      sched-entry S 0x0 2000000 \
+	      sched-entry S 0x1 3000000 \
+	      sched-entry S 0x0 4000000 \
+	      cycle-time-extension 100000 \
+	      cycle-time 9000000 \
+	      base-time 12345678900000000
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ tc/q_taprio.c | 64 ++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 53 insertions(+), 11 deletions(-)
+
+diff --git a/tc/q_taprio.c b/tc/q_taprio.c
+index 20804fc2..9a69b86b 100644
+--- a/tc/q_taprio.c
++++ b/tc/q_taprio.c
+@@ -155,8 +155,10 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ {
+ 	__s32 clockid = CLOCKID_INVALID;
+ 	struct tc_mqprio_qopt opt = { };
++	__s64 cycle_time_extension = 0;
+ 	struct list_head sched_entries;
+-	struct rtattr *tail;
++	struct rtattr *tail, *l;
++	__s64 cycle_time = 0;
+ 	__s64 base_time = 0;
+ 	int err, idx;
+ 
+@@ -245,6 +247,29 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 				PREV_ARG();
+ 				break;
+ 			}
++		} else if (strcmp(*argv, "cycle-time") == 0) {
++			NEXT_ARG();
++			if (cycle_time) {
++				fprintf(stderr, "taprio: duplicate \"cycle-time\" specification\n");
++				return -1;
++			}
++
++			if (get_s64(&cycle_time, *argv, 10)) {
++				PREV_ARG();
++				break;
++			}
++
++		} else if (strcmp(*argv, "cycle-time-extension") == 0) {
++			NEXT_ARG();
++			if (cycle_time_extension) {
++				fprintf(stderr, "taprio: duplicate \"cycle-time-extension\" specification\n");
++				return -1;
++			}
++
++			if (get_s64(&cycle_time_extension, *argv, 10)) {
++				PREV_ARG();
++				break;
++			}
+ 		} else if (strcmp(*argv, "clockid") == 0) {
+ 			NEXT_ARG();
+ 			if (clockid != CLOCKID_INVALID) {
+@@ -277,19 +302,24 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	if (base_time)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_BASE_TIME, &base_time, sizeof(base_time));
+ 
+-	if (!list_empty(&sched_entries)) {
+-		struct rtattr *entry_list;
+-		entry_list = addattr_nest(n, 1024, TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST | NLA_F_NESTED);
++	if (cycle_time)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME,
++			  &cycle_time, sizeof(cycle_time));
+ 
+-		err = add_sched_list(&sched_entries, n);
+-		if (err < 0) {
+-			fprintf(stderr, "Could not add schedule to netlink message\n");
+-			return -1;
+-		}
++	if (cycle_time_extension)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME_EXTENSION,
++			  &cycle_time_extension, sizeof(cycle_time_extension));
++
++	l = addattr_nest(n, 1024, TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST | NLA_F_NESTED);
+ 
+-		addattr_nest_end(n, entry_list);
++	err = add_sched_list(&sched_entries, n);
++	if (err < 0) {
++		fprintf(stderr, "Could not add schedule to netlink message\n");
++		return -1;
+ 	}
+ 
++	addattr_nest_end(n, l);
++
+ 	tail->rta_len = (void *) NLMSG_TAIL(n) - (void *) tail;
+ 
+ 	return 0;
+@@ -345,13 +375,25 @@ static int print_sched_list(FILE *f, struct rtattr *list)
+ 
+ static int print_schedule(FILE *f, struct rtattr **tb)
+ {
+-	int64_t base_time = 0;
++	int64_t base_time = 0, cycle_time = 0, cycle_time_extension = 0;
+ 
+ 	if (tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME])
+ 		base_time = rta_getattr_s64(tb[TCA_TAPRIO_ATTR_SCHED_BASE_TIME]);
+ 
++	if (tb[TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME])
++		cycle_time = rta_getattr_s64(tb[TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME]);
++
++	if (tb[TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME_EXTENSION])
++		cycle_time_extension = rta_getattr_s64(
++			tb[TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME_EXTENSION]);
++
+ 	print_lluint(PRINT_ANY, "base_time", "\tbase-time %lld", base_time);
+ 
++	print_lluint(PRINT_ANY, "cycle_time", " cycle-time %lld", cycle_time);
++
++	print_lluint(PRINT_ANY, "cycle_time_extension",
++		     " cycle-time-extension %lld", cycle_time_extension);
++
+ 	print_sched_list(f, tb[TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST]);
+ 
+ 	return 0;
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0008-utils-Fix-get_s64-function.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0008-utils-Fix-get_s64-function.patch
new file mode 100644
index 0000000..63a02b4
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0008-utils-Fix-get_s64-function.patch
@@ -0,0 +1,35 @@
+From 0c672a07e1d5a8068f2323e88a72e5349dacbed9 Mon Sep 17 00:00:00 2001
+From: Kurt Kanzenbach <kurt@linutronix.de>
+Date: Thu, 4 Jul 2019 14:24:27 +0200
+Subject: [PATCH 08/12] utils: Fix get_s64() function
+
+Upstream-Status: Backport
+commit c875433b145e33645798ecfe4d99bcb28c80d1e9 upstream.
+
+get_s64() uses internally strtoll() to parse the value out of a given
+string. strtoll() returns a long long. However, the intermediate variable is
+long only which might be 32 bit on some systems. So, fix it.
+
+Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ lib/utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/utils.c b/lib/utils.c
+index be29530f..9c121ce3 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -386,7 +386,7 @@ int get_u8(__u8 *val, const char *arg, int base)
+ 
+ int get_s64(__s64 *val, const char *arg, int base)
+ {
+-	long res;
++	long long res;
+ 	char *ptr;
+ 
+ 	errno = 0;
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0009-taprio-Add-support-for-setting-flags.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0009-taprio-Add-support-for-setting-flags.patch
new file mode 100644
index 0000000..95c1df4
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0009-taprio-Add-support-for-setting-flags.patch
@@ -0,0 +1,78 @@
+From 7e5c69b7a4733f099ca53aecfafa5dac4a3a002d Mon Sep 17 00:00:00 2001
+From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Date: Thu, 18 Jul 2019 12:55:40 -0700
+Subject: [PATCH 09/12] taprio: Add support for setting flags
+
+Upstream-Status: Backport
+commit ee000bf217870b6425849c03b309faa64539ff24 upstream.
+
+This allows a new parameter, flags, to be passed to taprio. Currently, it
+only supports enabling the txtime-assist mode. But, we plan to add
+different modes for taprio (e.g. hardware offloading) and this parameter
+will be useful in enabling those modes.
+
+Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
+Signed-off-by: Vedang Patel <vedang.patel@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ tc/q_taprio.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/tc/q_taprio.c b/tc/q_taprio.c
+index 9a69b86b..91e3f27b 100644
+--- a/tc/q_taprio.c
++++ b/tc/q_taprio.c
+@@ -158,6 +158,7 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	__s64 cycle_time_extension = 0;
+ 	struct list_head sched_entries;
+ 	struct rtattr *tail, *l;
++	__u32 taprio_flags = 0;
+ 	__s64 cycle_time = 0;
+ 	__s64 base_time = 0;
+ 	int err, idx;
+@@ -280,6 +281,17 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 				explain_clockid(*argv);
+ 				return -1;
+ 			}
++		} else if (strcmp(*argv, "flags") == 0) {
++			NEXT_ARG();
++			if (taprio_flags) {
++				fprintf(stderr, "taprio: duplicate \"flags\" specification\n");
++				return -1;
++			}
++			if (get_u32(&taprio_flags, *argv, 0)) {
++				PREV_ARG();
++				return -1;
++			}
++
+ 		} else if (strcmp(*argv, "help") == 0) {
+ 			explain();
+ 			return -1;
+@@ -296,6 +308,9 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	if (clockid != CLOCKID_INVALID)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_CLOCKID, &clockid, sizeof(clockid));
+ 
++	if (taprio_flags)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_FLAGS, &taprio_flags, sizeof(taprio_flags));
++
+ 	if (opt.num_tc > 0)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_PRIOMAP, &opt, sizeof(opt));
+ 
+@@ -441,6 +456,13 @@ static int taprio_print_opt(struct qdisc_util *qu, FILE *f, struct rtattr *opt)
+ 
+ 	print_string(PRINT_ANY, "clockid", "clockid %s", get_clock_name(clockid));
+ 
++	if (tb[TCA_TAPRIO_ATTR_FLAGS]) {
++		__u32 flags;
++
++		flags = rta_getattr_u32(tb[TCA_TAPRIO_ATTR_FLAGS]);
++		print_0xhex(PRINT_ANY, "flags", " flags %#x", flags);
++	}
++
+ 	print_schedule(f, tb);
+ 
+ 	if (tb[TCA_TAPRIO_ATTR_ADMIN_SCHED]) {
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0010-taprio-add-support-for-setting-txtime_delay.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0010-taprio-add-support-for-setting-txtime_delay.patch
new file mode 100644
index 0000000..1cc31c3
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0010-taprio-add-support-for-setting-txtime_delay.patch
@@ -0,0 +1,97 @@
+From 1f018de4a624dac26e7c4ea2a6b47a63d1c9c45f Mon Sep 17 00:00:00 2001
+From: Vedang Patel <vedang.patel@intel.com>
+Date: Thu, 18 Jul 2019 12:55:41 -0700
+Subject: [PATCH 10/12] taprio: add support for setting txtime_delay.
+
+Upstream-Status: Backport
+commit a5e6ee3b34226f76c8be4b1e3e3ad82212ea4d50 upstream.
+
+This adds support for setting the txtime_delay parameter which is useful
+for the txtime offload mode of taprio.
+
+Signed-off-by: Vedang Patel <vedang.patel@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ tc/q_taprio.c | 37 ++++++++++++++++++++++++++++++-------
+ 1 file changed, 30 insertions(+), 7 deletions(-)
+
+diff --git a/tc/q_taprio.c b/tc/q_taprio.c
+index 91e3f27b..5e498489 100644
+--- a/tc/q_taprio.c
++++ b/tc/q_taprio.c
+@@ -47,13 +47,14 @@ static const struct static_clockid {
+ 
+ static void explain(void)
+ {
+-	fprintf(stderr, "Usage: ... taprio clockid CLOCKID\n");
+-	fprintf(stderr, "                  [num_tc NUMBER] [map P0 P1 ...] ");
+-	fprintf(stderr, "                  [queues COUNT@OFFSET COUNT@OFFSET COUNT@OFFSET ...] ");
+-	fprintf(stderr, "                  [ [sched-entry index cmd gate-mask interval] ... ] ");
+-	fprintf(stderr, "                  [base-time time] ");
+-	fprintf(stderr, "\nCLOCKID must be a valid SYS-V id (i.e. CLOCK_TAI)");
+-	fprintf(stderr, "\n");
++	fprintf(stderr,
++		"Usage: ... taprio clockid CLOCKID\n"
++		"		[num_tc NUMBER] [map P0 P1 ...] "
++		"		[queues COUNT@OFFSET COUNT@OFFSET COUNT@OFFSET ...] "
++		"		[ [sched-entry index cmd gate-mask interval] ... ] "
++		"		[base-time time] [txtime-delay delay]"
++		"\n"
++		"CLOCKID must be a valid SYS-V id (i.e. CLOCK_TAI)\n");
+ }
+ 
+ static void explain_clockid(const char *val)
+@@ -159,6 +160,7 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	struct list_head sched_entries;
+ 	struct rtattr *tail, *l;
+ 	__u32 taprio_flags = 0;
++	__u32 txtime_delay = 0;
+ 	__s64 cycle_time = 0;
+ 	__s64 base_time = 0;
+ 	int err, idx;
+@@ -292,6 +294,17 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 				return -1;
+ 			}
+ 
++		} else if (strcmp(*argv, "txtime-delay") == 0) {
++			NEXT_ARG();
++			if (txtime_delay != 0) {
++				fprintf(stderr, "taprio: duplicate \"txtime-delay\" specification\n");
++				return -1;
++			}
++			if (get_u32(&txtime_delay, *argv, 0)) {
++				PREV_ARG();
++				return -1;
++			}
++
+ 		} else if (strcmp(*argv, "help") == 0) {
+ 			explain();
+ 			return -1;
+@@ -314,6 +327,9 @@ static int taprio_parse_opt(struct qdisc_util *qu, int argc,
+ 	if (opt.num_tc > 0)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_PRIOMAP, &opt, sizeof(opt));
+ 
++	if (txtime_delay)
++		addattr_l(n, 1024, TCA_TAPRIO_ATTR_TXTIME_DELAY, &txtime_delay, sizeof(txtime_delay));
++
+ 	if (base_time)
+ 		addattr_l(n, 1024, TCA_TAPRIO_ATTR_SCHED_BASE_TIME, &base_time, sizeof(base_time));
+ 
+@@ -463,6 +479,13 @@ static int taprio_print_opt(struct qdisc_util *qu, FILE *f, struct rtattr *opt)
+ 		print_0xhex(PRINT_ANY, "flags", " flags %#x", flags);
+ 	}
+ 
++	if (tb[TCA_TAPRIO_ATTR_TXTIME_DELAY]) {
++		__u32 txtime_delay;
++
++		txtime_delay = rta_getattr_s32(tb[TCA_TAPRIO_ATTR_TXTIME_DELAY]);
++		print_uint(PRINT_ANY, "txtime_delay", " txtime delay %d", txtime_delay);
++	}
++
+ 	print_schedule(f, tb);
+ 
+ 	if (tb[TCA_TAPRIO_ATTR_ADMIN_SCHED]) {
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0011-tc-taprio-Update-documentation.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0011-tc-taprio-Update-documentation.patch
new file mode 100644
index 0000000..f47ac17
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0011-tc-taprio-Update-documentation.patch
@@ -0,0 +1,81 @@
+From 5932369560e2ad1deecafa829edd0e89170a3545 Mon Sep 17 00:00:00 2001
+From: Vedang Patel <vedang.patel@intel.com>
+Date: Thu, 18 Jul 2019 12:55:43 -0700
+Subject: [PATCH 11/12] tc: taprio: Update documentation
+
+Upstream-Status: Backport
+commit a794d0523711d5ab4530483b9435ba627e07d28b upstream.
+
+Add documentation for the latest options, flags and txtime-delay, to the
+taprio manpage.
+
+This also adds an example to run tc in txtime offload mode.
+
+Signed-off-by: Vedang Patel <vedang.patel@intel.com>
+Signed-off-by: David Ahern <dsahern@gmail.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ man/man8/tc-taprio.8 | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/man/man8/tc-taprio.8 b/man/man8/tc-taprio.8
+index 92055b43..2cb39da3 100644
+--- a/man/man8/tc-taprio.8
++++ b/man/man8/tc-taprio.8
+@@ -112,6 +112,26 @@ means that traffic class 0 is "active" for that schedule entry.
+ long that state defined by <command> and <gate mask> should be held
+ before moving to the next entry.
+ 
++.TP
++flags
++.br
++Specifies different modes for taprio. Currently, only txtime-assist is
++supported which can be enabled by setting it to 0x1. In this mode, taprio will
++set the transmit timestamp depending on the interval in which the packet needs
++to be transmitted. It will then utililize the
++.BR etf(8)
++qdisc to sort and transmit the packets at the right time. The second example
++can be used as a reference to configure this mode.
++
++.TP
++txtime-delay
++.br
++This parameter is specific to the txtime offload mode. It specifies the maximum
++time a packet might take to reach the network card from the taprio qdisc. The
++value should always be greater than the delta specified in the
++.BR etf(8)
++qdisc.
++
+ .SH EXAMPLES
+ 
+ The following example shows how an traffic schedule with three traffic
+@@ -137,6 +157,26 @@ reference CLOCK_TAI. The schedule is composed of three entries each of
+               clockid CLOCK_TAI
+ .EE
+ 
++Following is an example to enable the txtime offload mode in taprio. See
++.BR etf(8)
++for more information about configuring the ETF qdisc.
++
++.EX
++# tc qdisc replace dev eth0 parent root handle 100 taprio \\
++              num_tc 3 \\
++              map 2 2 1 0 2 2 2 2 2 2 2 2 2 2 2 2 \\
++              queues 1@0 1@0 1@0 \\
++              base-time 1528743495910289987 \\
++              sched-entry S 01 300000 \\
++              sched-entry S 02 300000 \\
++              sched-entry S 04 400000 \\
++              flags 0x1 \\
++              txtime-delay 200000 \\
++              clockid CLOCK_TAI
++
++# tc qdisc replace dev $IFACE parent 100:1 etf skip_skb_check \\
++              offload delta 200000 clockid CLOCK_TAI
++.EE
+ 
+ .SH AUTHORS
+ Vinicius Costa Gomes <vinicius.gomes@intel.com>
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0012-sync-pkt_sched-header-with-kernel-version.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0012-sync-pkt_sched-header-with-kernel-version.patch
new file mode 100644
index 0000000..3f22520
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0012-sync-pkt_sched-header-with-kernel-version.patch
@@ -0,0 +1,131 @@
+From 3736970b76dc41cd2d76399650709eab6a031807 Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Thu, 17 Oct 2019 17:50:18 -0400
+Subject: [PATCH 12/12] sync pkt_sched header with kernel version
+
+For picking taprio specific definitions, sync up the pkt_sched.h with
+kernel header.
+
+Upstream-Status: Backport
+commit 720a44a751a922cc6e1e62ae3b7c3d5ae6c084f3 upstream.
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ include/uapi/linux/const.h     | 31 ++++++++++++++++
+ include/uapi/linux/pkt_sched.h | 64 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 95 insertions(+)
+ create mode 100644 include/uapi/linux/const.h
+
+diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
+new file mode 100644
+index 00000000..fd885c79
+--- /dev/null
++++ b/include/uapi/linux/const.h
+@@ -0,0 +1,31 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++/* const.h: Macros for dealing with constants.  */
++
++#ifndef _LINUX_CONST_H
++#define _LINUX_CONST_H
++
++/* Some constant macros are used in both assembler and
++ * C code.  Therefore we cannot annotate them always with
++ * 'UL' and other type specifiers unilaterally.  We
++ * use the following macros to deal with this.
++ *
++ * Similarly, _AT() will cast an expression with a type in C, but
++ * leave it unchanged in asm.
++ */
++
++#ifdef __ASSEMBLY__
++#define _AC(X,Y)	X
++#define _AT(T,X)	X
++#else
++#define __AC(X,Y)	(X##Y)
++#define _AC(X,Y)	__AC(X,Y)
++#define _AT(T,X)	((T)(X))
++#endif
++
++#define _UL(x)		(_AC(x, UL))
++#define _ULL(x)		(_AC(x, ULL))
++
++#define _BITUL(x)	(_UL(1) << (x))
++#define _BITULL(x)	(_ULL(1) << (x))
++
++#endif /* _LINUX_CONST_H */
+diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
+index 8975fd1a..9408fb43 100644
+--- a/include/uapi/linux/pkt_sched.h
++++ b/include/uapi/linux/pkt_sched.h
+@@ -1084,4 +1084,68 @@ enum {
+ 	CAKE_ATM_MAX
+ };
+ 
++
++/* TAPRIO */
++enum {
++	TC_TAPRIO_CMD_SET_GATES = 0x00,
++	TC_TAPRIO_CMD_SET_AND_HOLD = 0x01,
++	TC_TAPRIO_CMD_SET_AND_RELEASE = 0x02,
++};
++
++enum {
++	TCA_TAPRIO_SCHED_ENTRY_UNSPEC,
++	TCA_TAPRIO_SCHED_ENTRY_INDEX, /* u32 */
++	TCA_TAPRIO_SCHED_ENTRY_CMD, /* u8 */
++	TCA_TAPRIO_SCHED_ENTRY_GATE_MASK, /* u32 */
++	TCA_TAPRIO_SCHED_ENTRY_INTERVAL, /* u32 */
++	__TCA_TAPRIO_SCHED_ENTRY_MAX,
++};
++#define TCA_TAPRIO_SCHED_ENTRY_MAX (__TCA_TAPRIO_SCHED_ENTRY_MAX - 1)
++
++/* The format for schedule entry list is:
++ * [TCA_TAPRIO_SCHED_ENTRY_LIST]
++ *   [TCA_TAPRIO_SCHED_ENTRY]
++ *     [TCA_TAPRIO_SCHED_ENTRY_CMD]
++ *     [TCA_TAPRIO_SCHED_ENTRY_GATES]
++ *     [TCA_TAPRIO_SCHED_ENTRY_INTERVAL]
++ */
++enum {
++	TCA_TAPRIO_SCHED_UNSPEC,
++	TCA_TAPRIO_SCHED_ENTRY,
++	__TCA_TAPRIO_SCHED_MAX,
++};
++
++#define TCA_TAPRIO_SCHED_MAX (__TCA_TAPRIO_SCHED_MAX - 1)
++
++/* The format for the admin sched (dump only):
++ * [TCA_TAPRIO_SCHED_ADMIN_SCHED]
++ *   [TCA_TAPRIO_ATTR_SCHED_BASE_TIME]
++ *   [TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST]
++ *     [TCA_TAPRIO_ATTR_SCHED_ENTRY]
++ *       [TCA_TAPRIO_ATTR_SCHED_ENTRY_CMD]
++ *       [TCA_TAPRIO_ATTR_SCHED_ENTRY_GATES]
++ *       [TCA_TAPRIO_ATTR_SCHED_ENTRY_INTERVAL]
++ */
++
++#define TCA_TAPRIO_ATTR_FLAG_TXTIME_ASSIST	BIT(0)
++#define TCA_TAPRIO_ATTR_FLAG_FULL_OFFLOAD	BIT(1)
++
++enum {
++	TCA_TAPRIO_ATTR_UNSPEC,
++	TCA_TAPRIO_ATTR_PRIOMAP, /* struct tc_mqprio_qopt */
++	TCA_TAPRIO_ATTR_SCHED_ENTRY_LIST, /* nested of entry */
++	TCA_TAPRIO_ATTR_SCHED_BASE_TIME, /* s64 */
++	TCA_TAPRIO_ATTR_SCHED_SINGLE_ENTRY, /* single entry */
++	TCA_TAPRIO_ATTR_SCHED_CLOCKID, /* s32 */
++	TCA_TAPRIO_PAD,
++	TCA_TAPRIO_ATTR_ADMIN_SCHED, /* The admin sched, only used in dump */
++	TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME, /* s64 */
++	TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME_EXTENSION, /* s64 */
++	TCA_TAPRIO_ATTR_FLAGS, /* u32 */
++	TCA_TAPRIO_ATTR_TXTIME_DELAY, /* u32 */
++	__TCA_TAPRIO_ATTR_MAX,
++};
++
++#define TCA_TAPRIO_ATTR_MAX (__TCA_TAPRIO_ATTR_MAX - 1)
++
+ #endif
+-- 
+2.18.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
index 2100f49..7fa33f6 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago5"
+PR_append = ".arago6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -7,4 +7,16 @@ SRC_URI_append = " \
     file://0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch \
     file://0003-hsr-prp-refactor-common-code.patch \
     file://0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch \
+    file://0001-utils-Implement-get_s64.patch \
+    file://0002-include-Add-helper-to-retrieve-a-__s64-from-a-netlin.patch \
+    file://0003-libnetlink-Add-helper-for-getting-a-__s32-from-netli.patch \
+    file://0004-tc-Add-support-for-configuring-the-taprio-scheduler.patch \
+    file://0005-taprio-Add-manpage-for-tc-taprio-8.patch \
+    file://0006-taprio-Add-support-for-changing-schedules.patch \
+    file://0007-taprio-Add-support-for-cycle_time-and-cycle_time_ext.patch \
+    file://0008-utils-Fix-get_s64-function.patch \
+    file://0009-taprio-Add-support-for-setting-flags.patch \
+    file://0010-taprio-add-support-for-setting-txtime_delay.patch \
+    file://0011-tc-taprio-Update-documentation.patch \
+    file://0012-sync-pkt_sched-header-with-kernel-version.patch \
 "
-- 
1.9.1


