Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 90190529BC
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 20:57:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GKuuZg054890
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 15:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531774616;
	bh=GYYscRQgsG96iMgNKYiC7/xZaSuklHFy4BJPse8BeIo=;
	h=From:To:CC:Subject:Date;
	b=GzlGSMZUgvXcfIoeKDMQxif21M7jPme5uKDPFWV3FZDyyT8SVr2RBoF/jGxAjWpGE
	0o5h1ocLw1Bs13Mlu0FTnnsjS09yqBx6GOhYR14TcQfd3Gwo+SPOcMFCAJlc+hSXyn
	VnIHmfY1OocIP/jJqVETAXonb187cGk3viUSxWlQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GKuuaB020506
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 15:56:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 15:56:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 15:56:56 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GKuumu001574;
	Mon, 16 Jul 2018 15:56:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jul 2018 20:55:16 +0000
Message-ID: <20180716205516.6224-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] systemd: use eth0 as RequiredForOnline so systemd-networkd-wait-online won't stall
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
X-List-Received-Date: Mon, 16 Jul 2018 20:57:03 -0000
Content-Type: text/plain

Otherwise on systems with multiple interfaces systemd-networkd-wait-online
will wait for all of them to get configured before timing out after 2 minutes.
That'll block services that wait for network to come online, like Matrix, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - backport support for RequiredForOnline from v235

 ...rOnline-Link-attribute-for-.network-.patch | 195 ++++++++++++++++++
 .../systemd/systemd/10-eth.network            |   2 +-
 .../{10-eth.network => 15-eth.network}        |   3 +
 .../recipes-core/systemd/systemd_%.bbappend   |   5 +-
 4 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0001-Add-a-RequiredForOnline-Link-attribute-for-.network-.patch
 copy meta-arago-distro/recipes-core/systemd/systemd/{10-eth.network => 15-eth.network} (71%)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-Add-a-RequiredForOnline-Link-attribute-for-.network-.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-Add-a-RequiredForOnline-Link-attribute-for-.network-.patch
new file mode 100644
index 00000000..fc50c8dd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/0001-Add-a-RequiredForOnline-Link-attribute-for-.network-.patch
@@ -0,0 +1,195 @@
+From c1a3890410f043fe09af8b139eb6bfe2832089be Mon Sep 17 00:00:00 2001
+From: Mathieu Trudel-Lapierre <mathieu.tl@gmail.com>
+Date: Thu, 30 Nov 2017 12:03:50 -0500
+Subject: [PATCH] Add a "RequiredForOnline=" Link attribute for .network files
+ (#7347)
+
+RequiredForOnline= denotes a link/network that does/does not require being up
+for systemd-networkd-wait-online to consider the system online; this makes it
+possible to ignore devices without modifying parameters to wait-online.
+
+Upstream-Status: Backported
+---
+ man/systemd.network.xml                  | 15 +++++++++++++++
+ src/libsystemd/sd-network/sd-network.c   | 15 +++++++++++++++
+ src/network/networkd-link.c              |  3 +++
+ src/network/networkd-network-gperf.gperf |  1 +
+ src/network/networkd-network.c           |  1 +
+ src/network/networkd-network.h           |  2 ++
+ src/network/wait-online/link.c           |  2 ++
+ src/network/wait-online/link.h           |  2 +-
+ src/network/wait-online/manager.c        |  3 +++
+ src/systemd/sd-network.h                 |  8 ++++++++
+ 10 files changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/man/systemd.network.xml b/man/systemd.network.xml
+index 57f27e6f3..5a5ecb0b1 100644
+--- a/man/systemd.network.xml
++++ b/man/systemd.network.xml
+@@ -252,6 +252,21 @@
+           controlled by other applications.</para>
+         </listitem>
+       </varlistentry>
++      <varlistentry>
++        <term><varname>RequiredForOnline=</varname></term>
++        <listitem>
++          <para>A boolean. When <literal>yes</literal>, the network is deemed
++          required when determining whether the system is online when running
++          <literal>systemd-networkd-wait-online</literal>.
++          When <literal>no</literal>, the network is ignored when checking for
++          online state. Defaults to <literal>yes</literal>.</para>
++          <para>The network will be brought up normally in all cases, but in
++          the event that there is no address being assigned by DHCP or the
++          cable is not plugged in, the link will simply remain offline and be
++          skipped automatically by <literal>systemd-networkd-wait-online</literal>
++          if <literal>RequiredForOnline=true</literal>.</para>
++        </listitem>
++      </varlistentry>
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/src/libsystemd/sd-network/sd-network.c b/src/libsystemd/sd-network/sd-network.c
+index e0f38b62a..f6460b9f7 100644
+--- a/src/libsystemd/sd-network/sd-network.c
++++ b/src/libsystemd/sd-network/sd-network.c
+@@ -172,6 +172,21 @@ _public_ int sd_network_link_get_operational_state(int ifindex, char **state) {
+         return network_link_get_string(ifindex, "OPER_STATE", state);
+ }
+ 
++_public_ int sd_network_link_get_required_for_online(int ifindex) {
++        _cleanup_free_ char *s = NULL;
++        int r;
++
++        r = network_link_get_string(ifindex, "REQUIRED_FOR_ONLINE", &s);
++        if (r < 0) {
++                /* Handle -ENODATA as RequiredForOnline=yes, for compatibility */
++                if (r == -ENODATA)
++                        return true;
++                return r;
++        }
++
++        return parse_boolean(s);
++}
++
+ _public_ int sd_network_link_get_llmnr(int ifindex, char **llmnr) {
+         return network_link_get_string(ifindex, "LLMNR", llmnr);
+ }
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 473bd420d..67cdea0b9 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -3411,6 +3411,9 @@ int link_save(Link *link) {
+                 char **dhcp_domains = NULL;
+                 unsigned j;
+ 
++                fprintf(f, "REQUIRED_FOR_ONLINE=%s\n",
++                        yes_no(link->network->required_for_online));
++
+                 if (link->dhcp6_client) {
+                         r = sd_dhcp6_client_get_lease(link->dhcp6_client, &dhcp6_lease);
+                         if (r < 0 && r != -ENOMSG)
+diff --git a/src/network/networkd-network-gperf.gperf b/src/network/networkd-network-gperf.gperf
+index 62c47d6ea..46eaa8140 100644
+--- a/src/network/networkd-network-gperf.gperf
++++ b/src/network/networkd-network-gperf.gperf
+@@ -33,6 +33,7 @@ Link.MACAddress,                        config_parse_hwaddr,
+ Link.MTUBytes,                          config_parse_iec_size,                          0,                             offsetof(Network, mtu)
+ Link.ARP,                               config_parse_tristate,                          0,                             offsetof(Network, arp)
+ Link.Unmanaged,                         config_parse_bool,                              0,                             offsetof(Network, unmanaged)
++Link.RequiredForOnline,                 config_parse_bool,                              0,                             offsetof(Network, required_for_online)
+ Network.Description,                    config_parse_string,                            0,                             offsetof(Network, description)
+ Network.Bridge,                         config_parse_netdev,                            0,                             offsetof(Network, bridge)
+ Network.Bond,                           config_parse_netdev,                            0,                             offsetof(Network, bond)
+diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
+index 679d7ed36..8e37a0a22 100644
+--- a/src/network/networkd-network.c
++++ b/src/network/networkd-network.c
+@@ -205,6 +205,7 @@ static int network_load_one(Manager *manager, const char *filename) {
+ 
+         *d = '\0';
+ 
++        network->required_for_online = true;
+         network->dhcp = ADDRESS_FAMILY_NO;
+         network->dhcp_use_ntp = true;
+         network->dhcp_use_dns = true;
+diff --git a/src/network/networkd-network.h b/src/network/networkd-network.h
+index 4265ba634..49c62654b 100644
+--- a/src/network/networkd-network.h
++++ b/src/network/networkd-network.h
+@@ -215,6 +215,8 @@ struct Network {
+         uint32_t iaid;
+         DUID duid;
+ 
++        bool required_for_online; /* Is this network required to be considered online? */
++
+         LLDPMode lldp_mode; /* LLDP reception */
+         LLDPEmit lldp_emit; /* LLDP transmission */
+ 
+diff --git a/src/network/wait-online/link.c b/src/network/wait-online/link.c
+index dfe18bd96..f0cb70ab4 100644
+--- a/src/network/wait-online/link.c
++++ b/src/network/wait-online/link.c
+@@ -121,6 +121,8 @@ int link_update_rtnl(Link *l, sd_netlink_message *m) {
+ int link_update_monitor(Link *l) {
+         assert(l);
+ 
++        l->required_for_online = sd_network_link_get_required_for_online(l->ifindex) != 0;
++
+         l->operational_state = mfree(l->operational_state);
+ 
+         sd_network_link_get_operational_state(l->ifindex, &l->operational_state);
+diff --git a/src/network/wait-online/link.h b/src/network/wait-online/link.h
+index bf8b453c2..ab623ff4d 100644
+--- a/src/network/wait-online/link.h
++++ b/src/network/wait-online/link.h
+@@ -33,6 +33,7 @@ struct Link {
+         char *ifname;
+         unsigned flags;
+ 
++        bool required_for_online;
+         char *operational_state;
+         char *state;
+ };
+@@ -41,6 +42,5 @@ int link_new(Manager *m, Link **ret, int ifindex, const char *ifname);
+ Link *link_free(Link *l);
+ int link_update_rtnl(Link *l, sd_netlink_message *m);
+ int link_update_monitor(Link *l);
+-bool link_relevant(Link *l);
+ 
+ DEFINE_TRIVIAL_CLEANUP_FUNC(Link*, link_free);
+diff --git a/src/network/wait-online/manager.c b/src/network/wait-online/manager.c
+index f7a3ec849..05f030dbe 100644
+--- a/src/network/wait-online/manager.c
++++ b/src/network/wait-online/manager.c
+@@ -42,6 +42,9 @@ bool manager_ignore_link(Manager *m, Link *link) {
+         if (m->interfaces && !strv_contains(m->interfaces, link->ifname))
+                 return true;
+ 
++        if (!link->required_for_online)
++                return true;
++
+         /* ignore interfaces we explicitly are asked to ignore */
+         return strv_fnmatch(m->ignore, link->ifname, 0);
+ }
+diff --git a/src/systemd/sd-network.h b/src/systemd/sd-network.h
+index 7f5a6bd3f..2d48946d2 100644
+--- a/src/systemd/sd-network.h
++++ b/src/systemd/sd-network.h
+@@ -95,6 +95,14 @@ int sd_network_link_get_setup_state(int ifindex, char **state);
+  */
+ int sd_network_link_get_operational_state(int ifindex, char **state);
+ 
++/* Indicates whether the network is relevant to being online.
++ * Possible return codes:
++ *   0: the connection is not required
++ *   1: the connection is required to consider the system online
++ *   <0: networkd is not aware of the link
++ */
++int sd_network_link_get_required_for_online(int ifindex);
++
+ /* Get path to .network file applied to link */
+ int sd_network_link_get_network_file(int ifindex, char **filename);
+ 
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index 5d958664..b16ce4c3 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -1,5 +1,5 @@
 [Match]
-Name=eth*
+Name=eth0
 KernelCommandLine=!root=/dev/nfs
 
 [Network]
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
similarity index 71%
copy from meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
copy to meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
index 5d958664..be47a01f 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
@@ -2,5 +2,8 @@
 Name=eth*
 KernelCommandLine=!root=/dev/nfs
 
+[Link]
+RequiredForOnline=no
+
 [Network]
 DHCP=yes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f6cb9542..0c7c2be1 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago5"
+PR_append = ".arago6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -7,10 +7,12 @@ USERADD_PARAM_${PN} += "--system -d / -M --shell /bin/nologin systemd-network;"
 USERADD_PARAM_${PN} += "--system -d / -M --shell /bin/nologin systemd-resolve;"
 
 SRC_URI_append = " \
+    file://0001-Add-a-RequiredForOnline-Link-attribute-for-.network-.patch \
     file://local.rules \
     file://usb1-rules.sh \
     file://usb2-rules.sh \
     file://10-eth.network \
+    file://15-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
     file://sync-clocks.service \
@@ -26,6 +28,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
-- 
2.17.1


