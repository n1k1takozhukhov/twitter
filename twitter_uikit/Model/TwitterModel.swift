struct TwitterModel {
    var title: String
}


#if DEBUG
extension TwitterModel {
    static var sampleTwitterData = [
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report"),
        TwitterModel(title: "Submit reimbursement report")
    ]
}
#endif
