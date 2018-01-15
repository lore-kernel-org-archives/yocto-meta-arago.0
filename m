Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C2B6152A19
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 21:50:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FLo6Su029225
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 15:50:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516053006;
	bh=swF4CDTcIOvQp165hBJpx5jUNa3NbuIq+Uac+9V3L8w=;
	h=From:To:CC:Subject:Date;
	b=tbuMd/D2fOgm82phdGaGxtKXRaEEKfvmfRJe57L8+Ou5vInvGdJg26gbmgQOdd3zf
	j8/42VRKyg91w4v/4BCQQQO2VUkfbCzAMb2n1FMSjBS5m+gWNHaa3zDYlk/wEFL55P
	RIroeIxhL4K0SOKmU8jX+j1WVEmxRPvWBKA9cvEI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FLo5vm020450
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 15:50:06 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 15:50:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 15:50:05 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FLo54W010429;
	Mon, 15 Jan 2018 15:50:05 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Jan 2018 16:50:01 -0500
Message-ID: <1516053001-22617-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] linux-ti-staging: prueth: HSR/PRP: show node table entries for snmpwalk and debugfs
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
X-List-Received-Date: Mon, 15 Jan 2018 21:50:20 -0000
Content-Type: text/plain

* prueth: add ler_cnt field into new node table structure
* prueth: update prueth_hsr_prp_node_show to display the new node table
* prueth: fix lre_cnt_nodes address

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../linux/linux-ti-staging-4.9-patches.inc         |   5 +-
 ...ler_cnt-field-into-new-node-table-structu.patch |  78 +++++++++++++
 ...te-prueth_hsr_prp_node_show-to-display-th.patch | 126 +++++++++++++++++++++
 .../0149-prueth-fix-lre_cnt_nodes-address.patch    |  57 ++++++++++
 4 files changed, 265 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.9-patches/0147-prueth-add-ler_cnt-field-into-new-node-table-structu.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.9-patches/0148-prueth-update-prueth_hsr_prp_node_show-to-display-th.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.9-patches/0149-prueth-fix-lre_cnt_nodes-address.patch

diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
index a01deaa..000e00a 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches.inc
@@ -1,4 +1,4 @@
-PR_append = ".p33"
+PR_append = ".p34"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"
 
@@ -150,4 +150,7 @@ TI_LINUX_KERNEL_PATCHES = " \
     file://0144-prueth-move-definitions-to-the-header-file.patch \
     file://0145-net-ti-prueth-add-node-table.patch \
     file://0146-prueth-reinitialize-the-node-table-if-requested-by-n.patch \
+    file://0147-prueth-add-ler_cnt-field-into-new-node-table-structu.patch \
+    file://0148-prueth-update-prueth_hsr_prp_node_show-to-display-th.patch \
+    file://0149-prueth-fix-lre_cnt_nodes-address.patch \
 "
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0147-prueth-add-ler_cnt-field-into-new-node-table-structu.patch b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0147-prueth-add-ler_cnt-field-into-new-node-table-structu.patch
new file mode 100644
index 0000000..231cfc6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0147-prueth-add-ler_cnt-field-into-new-node-table-structu.patch
@@ -0,0 +1,78 @@
+From 62f9bf6a1f197f25058f916baf61fa9724b4ef9d Mon Sep 17 00:00:00 2001
+From: Vitaly Andrianov <vitalya@ti.com>
+Date: Sat, 23 Dec 2017 09:46:56 -0500
+Subject: [PATCH] prueth: add ler_cnt field into new node table structure.
+
+The lre_cnt_nodes variable, which is part of the old node table
+implementation is not updated. Create the lre_cnt inside the node_tbl
+structure to track number of nodes in the new table.
+
+Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
+Signed-off-by: Murali Kariceri <m-karicheri2@ti.com>
+---
+ drivers/net/ethernet/ti/pruss_node_tbl.c | 9 +++++++--
+ drivers/net/ethernet/ti/pruss_node_tbl.h | 2 +-
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/ti/pruss_node_tbl.c b/drivers/net/ethernet/ti/pruss_node_tbl.c
+index 5ec269fa..15e11af 100644
+--- a/drivers/net/ethernet/ti/pruss_node_tbl.c
++++ b/drivers/net/ethernet/ti/pruss_node_tbl.c
+@@ -79,18 +79,21 @@ static inline void lre_cnt_nodes_clear(struct node_tbl *nt)
+ {
+ 	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
+ 	*lre_cnt_nodes = 0;
++	nt->lre_cnt = 0;
+ }
+ 
+ static inline void lre_cnt_nodes_inc(struct node_tbl *nt)
+ {
+ 	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
+ 	*lre_cnt_nodes += 1;
++	nt->lre_cnt++;
+ }
+ 
+ static inline void lre_cnt_nodes_dec(struct node_tbl *nt)
+ {
+ 	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
+ 	*lre_cnt_nodes -= 1;
++	nt->lre_cnt--;
+ }
+ 
+ static inline bool node_expired(struct node_tbl *nt, u16 node, u16 forget_time)
+@@ -433,7 +436,8 @@ void pop_queue_process(struct prueth *prueth, spinlock_t *lock)
+ 			cnt_b += IND_BIN_NO(j);
+ 		}
+ 
+-	seq_printf(sfp, "\nTotal indexes %d; bins %d;\n", cnt_i, cnt_b);
++	seq_printf(sfp, "\nTotal indexes %d; bins %d;  lre_cnt %d\n",
++		   cnt_i, cnt_b, nt->lre_cnt);
+ 
+ 	return 0;
+ }
+@@ -482,7 +486,8 @@ void pop_queue_process(struct prueth *prueth, spinlock_t *lock)
+ 				   );
+ 			cnt++;
+ 		}
+-	seq_printf(sfp, "\nTotal valid entries %d\n", cnt);
++	seq_printf(sfp, "\nTotal valid entries %d; lre_cnt %d\n",
++		   cnt, nt->lre_cnt);
+ 
+ 	return 0;
+ }
+diff --git a/drivers/net/ethernet/ti/pruss_node_tbl.h b/drivers/net/ethernet/ti/pruss_node_tbl.h
+index 98c5112..36e7a0f 100644
+--- a/drivers/net/ethernet/ti/pruss_node_tbl.h
++++ b/drivers/net/ethernet/ti/pruss_node_tbl.h
+@@ -75,7 +75,7 @@ struct node_tbl {
+ 	struct bin_tbl_t	bin_tbl[BIN_TBL_MAX_ENTRIES];
+ 	struct node_tbl_t	node_tbl[NODE_TBL_MAX_ENTRIES];
+ 	u16 next_free_slot;
+-	u16 res1;
++	u16 lre_cnt;
+ 	u8  lock;
+ 	u8  lock2;
+ 	u8  res2[2];
+-- 
+1.9.1
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0148-prueth-update-prueth_hsr_prp_node_show-to-display-th.patch b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0148-prueth-update-prueth_hsr_prp_node_show-to-display-th.patch
new file mode 100644
index 0000000..0db781a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0148-prueth-update-prueth_hsr_prp_node_show-to-display-th.patch
@@ -0,0 +1,126 @@
+From 721957280dca659dd32666906c7687c403161330 Mon Sep 17 00:00:00 2001
+From: Vitaly Andrianov <vitalya@ti.com>
+Date: Sat, 23 Dec 2017 09:43:44 -0500
+Subject: [PATCH] prueth: update prueth_hsr_prp_node_show to display the new
+ node table
+
+This patch update prueth_hsr_prp_node_show() to display the contents of
+the new node table.
+
+Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ drivers/net/ethernet/ti/prueth.c | 59 +++++++++++++++++++---------------------
+ 1 file changed, 28 insertions(+), 31 deletions(-)
+
+diff --git a/drivers/net/ethernet/ti/prueth.c b/drivers/net/ethernet/ti/prueth.c
+index b4db51f..0c8941d 100644
+--- a/drivers/net/ethernet/ti/prueth.c
++++ b/drivers/net/ethernet/ti/prueth.c
+@@ -470,22 +470,27 @@ static int prueth_debugfs_init(struct prueth_emac *emac)
+ }
+ 
+ static void prueth_hsr_prp_node_show(struct seq_file *sfp,
+-				     struct prueth *prueth, u8 index)
++				     struct prueth *prueth, int index)
+ {
+-	void __iomem *sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+-	struct prueth_hsr_prp_node ent;
++	struct node_tbl *nt = prueth->nt;
++	struct bin_tbl_t *bin = &nt->bin_tbl[index];
++	struct node_tbl_t *node;
+ 	u8 val, is_hsr;
+ 
++	BUG_ON(bin->node_tbl_offset >= NODE_TBL_MAX_ENTRIES);
++
++	node = &nt->node_tbl[bin->node_tbl_offset];
++
+ 	seq_printf(sfp, "\nNode[%u]:\n", index);
+-	memcpy_fromio(&ent, sram + NODE_TABLE + index * 32, 32);
+ 	seq_printf(sfp, "MAC ADDR: %02x:%02x:%02x:%02x:%02x:%02x\n",
+-		   ent.mac[3], ent.mac[2], ent.mac[1],
+-		   ent.mac[0], ent.mac[5], ent.mac[4]);
++		   bin->src_mac_id[3], bin->src_mac_id[2],
++		   bin->src_mac_id[1], bin->src_mac_id[0],
++		   bin->src_mac_id[5], bin->src_mac_id[4]);
+ 	seq_printf(sfp, "state: %s\n",
+-		   ((ent.state & 0x1) ? "valid" : "invalid"));
++		   ((node->entry_state & 0x1) ? "valid" : "invalid"));
+ 
+ 	if (PRUETH_HAS_PRP(prueth)) {
+-		val = (ent.status & NT_REM_NODE_DUP_MASK);
++		val = (node->status & NT_REM_NODE_DUP_MASK);
+ 		switch (val) {
+ 		case NT_REM_NODE_DUP_DISCARD:
+ 			seq_printf(sfp, "DupDiscard (0x%02x)\n", val);
+@@ -499,8 +504,8 @@ static void prueth_hsr_prp_node_show(struct seq_file *sfp,
+ 		}
+ 	}
+ 
+-	is_hsr = ent.status & NT_REM_NODE_HSR_BIT;
+-	val = (ent.status & NT_REM_NODE_TYPE_MASK) >> NT_REM_NODE_TYPE_SHIFT;
++	is_hsr = node->status & NT_REM_NODE_HSR_BIT;
++	val = (node->status & NT_REM_NODE_TYPE_MASK) >> NT_REM_NODE_TYPE_SHIFT;
+ 	switch (val) {
+ 	case NT_REM_NODE_TYPE_SANA:
+ 		seq_puts(sfp, "SAN A\n");
+@@ -534,16 +539,16 @@ static void prueth_hsr_prp_node_show(struct seq_file *sfp,
+ 		break;
+ 	}
+ 
+-	seq_printf(sfp, "RxA=%u SupRxA=%u\n", ent.cnt_rx_a, ent.cnt_rx_sup_a);
+-	seq_printf(sfp, "RxB=%u SupRxB=%u\n", ent.cnt_rx_b, ent.cnt_rx_sup_b);
++	seq_printf(sfp, "RxA=%u SupRxA=%u\n", node->cnt_ra, node->cnt_rx_sup_a);
++	seq_printf(sfp, "RxB=%u SupRxB=%u\n", node->cnt_rb, node->cnt_rx_sup_b);
+ 
+ 	seq_printf(sfp, "Time Last Seen: Sup=%u RxA=%u RxB=%u\n",
+-		   ent.time_last_seen_sup, ent.time_last_seen_a,
+-		   ent.time_last_seen_b);
++		   node->time_last_seen_s, node->time_last_seen_a,
++		   node->time_last_seen_b);
+ 
+ 	if (prueth->eth_type == PRUSS_ETHTYPE_PRP)
+ 		seq_printf(sfp, "PRP LineID Err: A=%u B=%u\n",
+-			   ent.prp_lid_err_a, ent.prp_lid_err_b);
++			   node->err_wla, node->err_wlb);
+ }
+ 
+ /* prueth_hsr_prp_node_table_show - Formats and prints node_table entries
+@@ -552,26 +557,18 @@ static void prueth_hsr_prp_node_show(struct seq_file *sfp,
+ prueth_hsr_prp_node_table_show(struct seq_file *sfp, void *data)
+ {
+ 	struct prueth *prueth = (struct prueth *)sfp->private;
+-	void __iomem *sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+-	u8 i, index;
++	struct node_tbl *nt = prueth->nt;
++	int j;
+ 	u32 nodes;
+ 
+-	nodes = readl(sram + LRE_CNT_NODES);
+-	seq_printf(sfp, "\nRemote nodes in network: %u\n", nodes);
+-
+-	for (i = 0; i < nodes + 2; i++) {
+-		index = readb(sram + INDEX_ARRAY + i);
++	nodes = nt->lre_cnt;
++	seq_printf(sfp, "\nRemote nodes in network: %u\n", nt->lre_cnt);
+ 
+-		if (!index)
+-			/* first index guard */
+-			continue;
+-
+-		if (index == NODE_TABLE_SIZE_MAX + 1)
+-			/* last index guard */
+-			break;
+-
+-		prueth_hsr_prp_node_show(sfp, prueth, index);
++	for (j = 0; j < BIN_TBL_MAX_ENTRIES; j++) {
++		if (nt->bin_tbl[j].node_tbl_offset < NODE_TBL_MAX_ENTRIES)
++			prueth_hsr_prp_node_show(sfp, prueth, j);
+ 	}
++
+ 	seq_puts(sfp, "\n");
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9-patches/0149-prueth-fix-lre_cnt_nodes-address.patch b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0149-prueth-fix-lre_cnt_nodes-address.patch
new file mode 100644
index 0000000..5a2b62f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9-patches/0149-prueth-fix-lre_cnt_nodes-address.patch
@@ -0,0 +1,57 @@
+From dff2d21c01001648c9265b11cb410e1d3bfb10f9 Mon Sep 17 00:00:00 2001
+From: Vitaly Andrianov <vitalya@ti.com>
+Date: Wed, 3 Jan 2018 14:52:15 -0500
+Subject: [PATCH] prueth: fix lre_cnt_nodes address
+
+This patch adds back the the lre_cnt_nodes variable to fix the snmp
+query handling for Node Table
+
+Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ drivers/net/ethernet/ti/pruss_node_tbl.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/ti/pruss_node_tbl.c b/drivers/net/ethernet/ti/pruss_node_tbl.c
+index 15e11af..071cf63 100644
+--- a/drivers/net/ethernet/ti/pruss_node_tbl.c
++++ b/drivers/net/ethernet/ti/pruss_node_tbl.c
+@@ -15,6 +15,7 @@
+ #include <linux/string.h>
+ #include <linux/spinlock_types.h>
+ #include "pruss_node_tbl.h"
++#include "hsr_prp_firmware.h"
+ 
+ #define IND_BINOFS(x) nt->index_tbl[x].bin_offset
+ #define IND_BIN_NO(x) nt->index_tbl[x].bin_no_entries
+@@ -77,21 +78,24 @@ int node_table_insert(struct prueth *prueth, u8 *mac, int port, int sv_frame,
+ 
+ static inline void lre_cnt_nodes_clear(struct node_tbl *nt)
+ {
+-	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
++	u32 *lre_cnt_nodes = (u32 *)((void *)nt + LRE_CNT_NODES -
++				     NODE_TABLE_NEW);
+ 	*lre_cnt_nodes = 0;
+ 	nt->lre_cnt = 0;
+ }
+ 
+ static inline void lre_cnt_nodes_inc(struct node_tbl *nt)
+ {
+-	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
++	u32 *lre_cnt_nodes = (u32 *)((void *)nt + LRE_CNT_NODES -
++				     NODE_TABLE_NEW);
+ 	*lre_cnt_nodes += 1;
+ 	nt->lre_cnt++;
+ }
+ 
+ static inline void lre_cnt_nodes_dec(struct node_tbl *nt)
+ {
+-	u32 *lre_cnt_nodes = (u32 *)((void *)nt + 192 - 0x3000);
++	u32 *lre_cnt_nodes = (u32 *)((void *)nt + LRE_CNT_NODES -
++				     NODE_TABLE_NEW);
+ 	*lre_cnt_nodes -= 1;
+ 	nt->lre_cnt--;
+ }
+-- 
+1.9.1
+
-- 
1.9.1


